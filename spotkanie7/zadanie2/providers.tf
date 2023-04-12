terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  alias = "hub"
  features {}
  subscription_id = var.hub_sub_id
}

provider "azurerm" {
  alias = "spoke"
  features {}
  subscription_id = var.spoke_sub_id
}