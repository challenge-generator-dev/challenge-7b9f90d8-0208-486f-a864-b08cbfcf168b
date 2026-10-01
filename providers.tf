# Terraform configuration for Kubernetes and Helm providers
# This file declares the required providers and their versions to interact with the Kubernetes cluster
# and manage Helm releases.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}

# Configure the Kubernetes provider to interact with the cluster
# The provider will use the default kubeconfig file (~/.kube/config)
# or the context specified in the KUBE_CONFIG_CONTEXT environment variable.
provider "kubernetes" {
  # Use the default kubeconfig file
  config_path = "~/.kube/config"
}

# Configure the Helm provider to manage Helm releases
# The provider will use the same kubeconfig configuration as the Kubernetes provider.
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Configure the kubectl provider for applying Kubernetes manifests directly
# This is useful for resources that are not yet supported by the Kubernetes provider.
provider "kubectl" {
  # Use the default kubeconfig file
  config_path = "~/.kube/config"
}

# Configure the ArgoCD provider for managing ArgoCD applications
# This provider requires the ArgoCD server URL and authentication credentials.
provider "argocd" {
  server_addr = var.argocd_server_addr
  insecure    = var.argocd_insecure
  username    = var.argocd_username
  password    = var.argocd_password
}