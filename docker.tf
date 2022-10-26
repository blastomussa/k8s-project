# terraform {
#   required_providers {
#     docker = {
#       source  = "kreuzwerker/docker"
#      version = "~> 2.13.0"
#     }
#   }
# }

# provider "docker" {}

# resource "docker_image" "test" {
#   name         = "blastomussa/frontend-react-app"
#   keep_locally = false
# }

# resource "docker_container" "test" {
#   image = docker_image.test.latest
#   name  = "container-test"
#   ports {
#     internal = 80
#     external = 8080
#   }
# }
