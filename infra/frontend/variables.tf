variable "rg_name" {}
variable "location" { default = "westeurope" }
variable "env_name" { default = "app-env" }
variable "frontend_image" {}
variable "acr_login_server" {}
variable "frontend_name" { default = "admin-panel" }
variable "container_app_environment_id" {}