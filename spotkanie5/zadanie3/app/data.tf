data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_virtual_network" "shared" {
  name = "${local.prefix_shared}-vnet"
  resource_group_name = data.azurerm_resource_group.rg.name
}


output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.rg.location
  description = "resourceGroupLocation"
}
