terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "al-wilkinson"
    workspaces {
      name = "WildWildWest"
    }
  }
}


provider "azurerm" {
  features {}
  # skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "terrastuff"
  location = "Australia East"
}

resource "azurerm_key_vault" "kv" {
  name                = "alwkvt133515"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "standard"
}
