# Storage Account para imágenes y assets
variable "rg_name" {}
variable "location" {}
variable "storage_account_name" {}
variable "container_images_name" { default = "car-images" }

resource "azurerm_storage_account" "st" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false
}

resource "azurerm_storage_container" "images" {
  name                  = var.container_images_name
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

output "storage_account_name" { value = azurerm_storage_account.st.name }
output "images_container_name" { value = azurerm_storage_container.images.name }
output "images_container_url" {
  value = "https://${azurerm_storage_account.st.name}.blob.core.windows.net/${azurerm_storage_container.images.name}"
}