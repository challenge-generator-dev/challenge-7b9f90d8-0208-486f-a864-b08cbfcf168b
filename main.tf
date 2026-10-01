terraform {
  required_version = ">= 1.6.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-fintech-prod"
    key    = "kubernetes-cluster/state"
    region = "us-east-1"
  }
}

provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  token                  = var.cluster_token

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    token                  = var.cluster_token

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    }
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    labels = {
      name        = "monitoring"
      environment = var.environment
    }
  }
}

resource "kubernetes_namespace" "microservices" {
  metadata {
    name = "microservices"
    labels = {
      name        = "microservices"
      environment = var.environment
    }
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
    labels = {
      name        = "argocd"
      environment = var.environment
    }
  }
}

resource "kubernetes_secret" "docker_registry" {
  metadata {
    name      = "docker-registry-secret"
    namespace = kubernetes_namespace.microservices.id
  }

  data = {
    ".dockerconfigjson" = var.docker_config_json
  }

  type = "kubernetes.io/dockerconfigjson"
}

resource "kubernetes_config_map" "prometheus_rules" {
  metadata {
    name      = "prometheus-alerts"
    namespace = kubernetes_namespace.monitoring.id
  }

  data = {
    "alerts.yml" = <<-EOT
      groups:
        - name: microservice-alerts
          rules:
            - alert: HighErrorRate
              expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: "High error rate detected"
                description: "Service {{ $labels.service }} has error rate above 5%"
            - alert: HighLatency
              expr: histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m])) > 1
              for: 5m
              labels:
                severity: warning
              annotations:
                summary: "High latency detected"
                description: "Service {{ $labels.service }} p99 latency above 1s"
            - alert: ServiceDown
              expr: up{job="kubernetes-nodes"} == 0
              for: 2m
              labels:
                severity: critical
              annotations:
                summary: "Service is down"
                description: "{{ $labels.instance }} has been down for more than 2 minutes"
    EOT
  }
}

resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.8.4"
  namespace  = kubernetes_namespace.argocd.id
  timeout    = 300

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hostname"
    value = var.argocd_hostname
  }

  set {
    name  = "dex.enabled"
    value = "false"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "25.8.0"
  namespace  = kubernetes_namespace.monitoring.id
  timeout    = 300

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "pushgateway.enabled"
    value = "true"
  }

  set {
    name  = "alertmanager.enabled"
    value = "true"
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.58.9"
  namespace  = kubernetes_namespace.monitoring.id
  timeout    = 300

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "admin.password"
    value = var.grafana_admin_password
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0]"
    value = var.grafana_hostname
  }
}