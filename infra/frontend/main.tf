resource "azurerm_container_app" "admin" {
  name                         = "${var.frontend_name}-${var.env_name}"
  resource_group_name          = var.rg_name
  container_app_environment_id = var.container_app_environment_id
  revision_mode                = "Single"

  template {
    container {
      name   = var.frontend_name
      image  = "${var.acr_login_server}/${var.frontend_image}"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    transport        = "auto"
  }
}

output "admin_url" {
  value = azurerm_container_app.admin.latest_revision_fqdn
}