terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e0a3aa17-0bd9-4dc5-803d-6ea393ade30a"
}