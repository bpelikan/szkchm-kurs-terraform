data "azurerm_resource_group" "rg" {
  provider = azurerm.shared
  name     = var.rg_name
}


output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.rg.location
  description = "resourceGroupLocation"
}
