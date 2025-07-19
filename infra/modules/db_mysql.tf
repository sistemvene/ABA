# MySQL Flexible Server
variable "rg_name" {}
variable "location" {}
variable "mysql_name" {}
variable "admin_user" { default = "dbadmin" }
variable "admin_password" {}
variable "sku_tier" { default = "Burstable" }
variable "sku_name" { default = "B1ms" }
variable "version"  { default = "8.0.21" }
variable "storage_size_gb" { default = 20 }
variable "backup_retention_days" { default = 7 }
variable "db_name" { default = "appdb" }

resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = var.mysql_name
  resource_group_name    = var.rg_name
  location               = var.location
  administrator_login    = var.admin_user
  administrator_password = var.admin_password
  sku_name               = var.sku_name
  storage_mb             = var.storage_size_gb * 1024
  version                = var.version
  backup_retention_days  = var.backup_retention_days
  high_availability {
    mode = "Disabled"
  }
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = var.db_name
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}

output "mysql_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}
output "mysql_connection_string" {
  sensitive = true
  value     = "mysql://${var.admin_user}:${var.admin_password}@${azurerm_mysql_flexible_server.mysql.fqdn}/${var.db_name}"
}