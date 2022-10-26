#Kubernetes Deployment
resource "kubernetes_deployment" "api" {
  metadata {
    name = "soap-recipe-api"
    labels = {
      App = "SoapAPI"
    }
    namespace = "backend"
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        App = "SoapAPI"
      }
    }
    template {
      metadata {
        labels = {
          App = "SoapAPI"
        }
      }
      spec {
        container {
          image = "blastomussa/soap-recipe-api:latest"
          name  = "api"

          port {
            container_port = 80
          }

          volume_mount {
            name       = "shared-volume"
            mount_path = "/mnt"
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 10
            period_seconds        = 10
          }

          resources {
            limits = {
              cpu    = "200m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "128Mi"
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


