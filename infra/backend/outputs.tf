output "container_app_urls" {
  value = {
    for k, v in azurerm_container_app.apps :
    k => v.latest_revision_fqdn
  }
}