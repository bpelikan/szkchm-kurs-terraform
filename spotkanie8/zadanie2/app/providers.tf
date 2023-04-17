terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  alias = "app"
  subscription_id = var.sub_id_app
}

provider "azurerm" {
  features {}
  alias = "shared"
  subscription_id = var.sub_id_shared
}

provider "random" {
}