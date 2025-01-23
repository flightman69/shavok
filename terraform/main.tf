terraform {
  required_providers {
    railway = {
      source  = "terraform-community-providers/railway"
      version = "0.4.4"
    }
  }
}

provider "railway" {
  token = var.railway_token
}

# resource "railway_environment" "production" {
#   project_id = "92a42d76-6225-4272-bede-74fd78f525c4"
#   name       = "production"
# }
#
# resource "railway_service" "flask_backend" {
#   project_id = railway_environment.production.project_id
#   name       = "flask_backend"
#
#   source = {
#     type = "dockerfile"
#     path = "../Dockerfile"
#   }
# }
#
# resource "railway_service" "flask_env" {
#   project_id = railway_environment.production.project_id
#   service_id = railway_service.flask_backend.id
#   key        = "FLASK_ENV"
#   value      = "production"
# }
#
# resource "railway_service" "port" {
#   project_id = railway_environment.production.project_id
#   service_id = railway_service.flask_backend.id
#   key        = "PORT"
#   value      = "5000"
# }
