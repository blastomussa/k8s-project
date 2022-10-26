provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

resource "kubernetes_namespace" "back" {
  metadata {
    name = "backend"
  }
}

resource "kubernetes_namespace" "front" {
  metadata {
    name = "frontend"
  }
}