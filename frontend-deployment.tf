#Kubernetes Deployment
resource "kubernetes_deployment" "react" {
  metadata {
    name = "react-app"
    labels = {
      App = "React"
    }
    namespace = "frontend"
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        App = "React"
      }
    }
    template {
      metadata {
        labels = {
          App = "React"
        }
      }
      spec {
        container {
          image = "blastomussa/frontend-react-app"
          name  = "react-app"

          port {
            container_port = 3000
          }

          volume_mount {
            name       = "shared-volume"
            mount_path = "/mnt"
          }

          resources {
            limits = {
              cpu    = "200m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "256Mi"
            }
          }
        }
        volume {
            name = "shared-volume"
            host_path {
              path = "/Users/joecourtney/shared-volume"
            }
          }
      }
    }
  }
}


