# Key Vault para secretos
variable "rg_name" {}
variable "location" {}
variable "kv_name" {}
variable "tenant_id" {}
variable "object_id_admin" {} # Object ID de quien tendrá acceso (tu usuario o grupo)

resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id_admin

    secret_permissions = ["Get", "List", "Set", "Delete"]
    key_permissions    = ["Get", "List", "Create"]
  }
}

output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}