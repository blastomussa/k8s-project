# Kubernetes Service
resource "kubernetes_service" "api" {
  metadata {
    name      = "api-svc"
    namespace = "backend"
  }
  spec {
    selector = {
      App = kubernetes_deployment.api.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port      = 80
      node_port = 30000
    }

    type = "NodePort"
  }
}


resource "kubernetes_service" "react" {
  metadata {
    name      = "react-svc"
    namespace = "frontend"
  }
  spec {
    selector = {
      App = kubernetes_deployment.react.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port      = 3000
      node_port = 30001
    }

    type = "NodePort"
  }
}