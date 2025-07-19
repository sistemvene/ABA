# Service Bus Namespace, Topic y una Subscription de ejemplo
variable "rg_name" {}
variable "location" {}
variable "sb_namespace_name" {}
variable "topic_name" { default = "offers" }
variable "subscription_name" { default = "offers-worker" }
variable "sku" { default = "Standard" }

resource "azurerm_servicebus_namespace" "ns" {
  name                = var.sb_namespace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku
}

resource "azurerm_servicebus_topic" "topic" {
  name                = var.topic_name
  namespace_name      = azurerm_servicebus_namespace.ns.name
  resource_group_name = var.rg_name
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "sub" {
  name                = var.subscription_name
  namespace_name      = azurerm_servicebus_namespace.ns.name
  topic_name          = azurerm_servicebus_topic.topic.name
  resource_group_name = var.rg_name
  max_delivery_count  = 10
}

output "servicebus_namespace_name" { value = azurerm_servicebus_namespace.ns.name }
output "servicebus_topic_name"     { value = azurerm_servicebus_topic.topic.name }
output "servicebus_subscription_name" { value = azurerm_servicebus_subscription.sub.name }
