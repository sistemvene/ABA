# Entorno de Azure Container Apps + Log Analytics
variable "rg_name" {}
variable "location" {}
variable "env_name" {}
variable "log_analytics_name" { default = "logs-workspace" }
variable "log_analytics_sku"  { default = "PerGB2018" }
variable "retention_days"     { default = 30 }

resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.retention_days
}

resource "azurerm_container_app_environment" "env" {
  name                       = var.env_name
  location                   = var.location
  resource_group_name        = var.rg_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.env.id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.law.id
}