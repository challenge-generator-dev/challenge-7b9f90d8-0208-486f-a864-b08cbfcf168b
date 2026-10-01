# Terraform variables for configuring the Kubernetes, Helm, and ArgoCD providers
# These variables allow customization of the deployment without modifying the provider configuration.

variable "kube_config_path" {
  description = "Path to the kubeconfig file used by the Kubernetes and Helm providers"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_config_context" {
  description = "Name of the Kubernetes context to use from the kubeconfig file"
  type        = string
  default     = ""
}

variable "argocd_server_addr" {
  description = "URL of the ArgoCD server (e.g., 'argocd.example.com')"
  type        = string
}

variable "argocd_insecure" {
  description = "Whether to skip TLS verification for the ArgoCD server"
  type        = bool
  default     = false
}

variable "argocd_username" {
  description = "Username for authenticating with the ArgoCD server"
  type        = string
  default     = "admin"
}

variable "argocd_password" {
  description = "Password for authenticating with the ArgoCD server"
  type        = string
  sensitive   = true
}

variable "namespace" {
  description = "Kubernetes namespace where the microservices will be deployed"
  type        = string
  default     = "microservices"
}

variable "service_account_name" {
  description = "Name of the Kubernetes service account used by the microservices"
  type        = string
  default     = "microservice-sa"
}

variable "prometheus_namespace" {
  description = "Kubernetes namespace where Prometheus will be deployed"
  type        = string
  default     = "monitoring"
}

variable "grafana_namespace" {
  description = "Kubernetes namespace where Grafana will be deployed"
  type        = string
  default     = "monitoring"
}

variable "argocd_namespace" {
  description = "Kubernetes namespace where ArgoCD will be deployed"
  type        = string
  default     = "argocd"
}

variable "helm_chart_version" {
  description = "Version of the Helm chart to deploy for the microservices"
  type        = string
  default     = "0.1.0"
}

variable "service_a_image" {
  description = "Docker image for service-a"
  type        = string
  default     = "ghcr.io/example/service-a:latest"
}

variable "service_a_replicas" {
  description = "Number of replicas for service-a"
  type        = number
  default     = 2
}

variable "service_a_cpu_request" {
  description = "CPU request for service-a containers"
  type        = string
  default     = "100m"
}

variable "service_a_memory_request" {
  description = "Memory request for service-a containers"
  type        = string
  default     = "256Mi"
}

variable "service_a_cpu_limit" {
  description = "CPU limit for service-a containers"
  type        = string
  default     = "500m"
}

variable "service_a_memory_limit" {
  description = "Memory limit for service-a containers"
  type        = string
  default     = "512Mi"
}

variable "argocd_repo_url" {
  description = "Git repository URL for ArgoCD application synchronization"
  type        = string
}

variable "argocd_target_revision" {
  description = "Git branch, tag, or commit SHA for ArgoCD application synchronization"
  type        = string
  default     = "main"
}

variable "prometheus_version" {
  description = "Version of Prometheus to deploy"
  type        = string
  default     = "2.47.0"
}

variable "grafana_version" {
  description = "Version of Grafana to deploy"
  type        = string
  default     = "10.2.3"
}

variable "argocd_version" {
  description = "Version of ArgoCD to deploy"
  type        = string
  default     = "2.9.5"
}