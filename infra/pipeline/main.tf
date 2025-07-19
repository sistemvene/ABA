resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
