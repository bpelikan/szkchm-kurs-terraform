terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.45.0"
      configuration_aliases = [
        azurerm.hub,
        azurerm.spoke
      ]
    }
  }
}
