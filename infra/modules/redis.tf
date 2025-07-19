# Azure Cache for Redis (básico)
variable "rg_name" {}
variable "location" {}
variable "redis_name" {}
variable "capacity" { default = 0 }
variable "family" { default = "C" }
variable "sku_name" { default = "Basic" }
variable "enable_non_ssl_port" { default = false }

resource "azurerm_redis_cache" "redis" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.rg_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  enable_non_ssl_port = var.enable_non_ssl_port
}

output "redis_hostname" { value = azurerm_redis_cache.redis.hostname }
output "redis_primary_key" {
  sensitive = true
  value     = azurerm_redis_cache.redis.primary_access_key
}