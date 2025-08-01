terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.100"
    }
  }
}

provider "azurerm" { features {} }