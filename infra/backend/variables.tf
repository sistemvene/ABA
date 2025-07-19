variable "rg_name" {}
variable "location" { default = "westeurope" }
variable "env_name" { default = "app-env" }
variable "log_analytics_name" { default = "logs-workspace" }

variable "mysql_admin_password" { sensitive = true }
variable "tenant_id" {}
variable "object_id_admin" {}

variable "app_name_prefix" { default = "autos" }
variable "acr_login_server" {}
variable "images_storage_account_name" {}
variable "kv_name" { default = "autos-kv" }

# Imágenes de cada microservicio
variable "auth_image" {}
variable "vehicles_image" {}
variable "catalog_image" {}
variable "offers_image" {}
variable "media_image" {}
variable "notifications_image" {}

# Redis / Service Bus
variable "redis_name" { default = "autos-redis" }
variable "sb_namespace_name" { default = "autos-sb" }
