# Crea el Resource Group base
variable "rg_name" {}
variable "location" { default = "westeurope" }

resource "azurerm_resource_group" "main" {
  name     = var.rg_name
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
output "location" {
  value = azurerm_resource_group.main.location
}