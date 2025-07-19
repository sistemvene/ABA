module "db" {
  source         = "../modules"
  rg_name        = var.rg_name
  location       = var.location
  mysql_name     = var.mysql_name
  admin_password = var.admin_password
  db_name        = var.db_name
}
