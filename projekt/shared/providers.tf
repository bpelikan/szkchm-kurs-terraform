terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.54.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  alias           = "shared"
  subscription_id = var.sub_id
}
