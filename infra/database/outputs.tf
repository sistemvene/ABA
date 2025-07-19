output "mysql_fqdn" {
  value = module.db.mysql_fqdn
}

output "mysql_connection_string" {
  sensitive = true
  value     = module.db.mysql_connection_string
}