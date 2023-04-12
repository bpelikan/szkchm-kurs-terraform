data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hub_rg_name
}

data "azurerm_resource_group" "spoke" {
  provider = azurerm.spoke
  name     = var.spoke_rg_name
}


output "resource_group_id" {
  value = data.azurerm_resource_group.hub.id
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.spoke.location
  description = "resourceGroupLocation"
}
