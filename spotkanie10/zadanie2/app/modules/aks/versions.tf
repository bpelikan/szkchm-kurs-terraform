terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.54.0"
      configuration_aliases = [
        azurerm.aks,
        azurerm.acr
      ]
    }
  }
}
