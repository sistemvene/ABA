# Reutiliza los módulos compartidos
module "rg" {
  source  = "../modules"
  rg_name = var.rg_name
  location = var.location
}

# Entorno Container Apps + Log Analytics
module "env" {
  source                 = "../modules"
  env_name               = var.env_name
  rg_name                = module.rg.resource_group_name
  location               = module.rg.location
  log_analytics_name     = var.log_analytics_name
}

# Key Vault
module "kv" {
  source        = "../modules"
  kv_name       = var.kv_name
  rg_name       = module.rg.resource_group_name
  location      = module.rg.location
  tenant_id     = var.tenant_id
  object_id_admin = var.object_id_admin
}

# Storage (imágenes)
module "storage" {
  source                = "../modules"
  storage_account_name  = var.images_storage_account_name
  rg_name               = module.rg.resource_group_name
  location              = module.rg.location
}

# MySQL Flexible Server
module "db" {
  source            = "../modules"
  mysql_name        = "${var.app_name_prefix}-mysql"
  rg_name           = module.rg.resource_group_name
  location          = module.rg.location
  admin_password    = var.mysql_admin_password
  db_name           = "main"
}

# Redis
module "redis" {
  source   = "../modules"
  redis_name = var.redis_name
  rg_name  = module.rg.resource_group_name
  location = module.rg.location
}

# Service Bus
module "servicebus" {
  source            = "../modules"
  sb_namespace_name = var.sb_namespace_name
  rg_name           = module.rg.resource_group_name
  location          = module.rg.location
}

# Microservicios (cada uno un Container App)
locals {
  container_apps = {
    auth = {
      name  = "auth"
      image = var.auth_image
      env   = {
        MYSQL_CONN = module.db.mysql_connection_string
        REDIS_HOST = module.redis.redis_hostname
        KEY_VAULT  = module.kv.key_vault_uri
        SB_TOPIC   = module.servicebus.servicebus_topic_name
      }
    }
    vehicles = {
      name  = "vehicles"
      image = var.vehicles_image
      env   = {
        MYSQL_CONN = module.db.mysql_connection_string
        REDIS_HOST = module.redis.redis_hostname
      }
    }
    catalog = {
      name  = "catalog"
      image = var.catalog_image
      env   = {
        MYSQL_CONN = module.db.mysql_connection_string
        REDIS_HOST = module.redis.redis_hostname
      }
    }
    offers = {
      name  = "offers"
      image = var.offers_image
      env   = {
        MYSQL_CONN = module.db.mysql_connection_string
        SB_TOPIC   = module.servicebus.servicebus_topic_name
      }
    }
    media = {
      name  = "media"
      image = var.media_image
      env   = {
        STORAGE_URL = module.storage.images_container_url
      }
    }
    notifications = {
      name  = "notifications"
      image = var.notifications_image
      env   = {
        SB_TOPIC   = module.servicebus.servicebus_topic_name
        REDIS_HOST = module.redis.redis_hostname
      }
    }
  }
}

# Crear cada Container App usando un recurso dinámico
resource "azurerm_container_app" "apps" {
  for_each            = local.container_apps
  name                = "${each.key}-${var.env_name}"
  resource_group_name = module.rg.resource_group_name
  container_app_environment_id = module.env.container_app_environment_id
  revision_mode       = "Single"

  template {
    container {
      name   = each.value.name
      image  = "${var.acr_login_server}/${each.value.image}"
      cpu    = 0.25
      memory = "0.5Gi"

      dynamic "env" {
        for_each = each.value.env
        content {
          name  = env.key
          value = env.value
        }
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    transport        = "auto"
  }
}