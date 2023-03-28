data "azurerm_resource_group" "main_rg" {
  name = var.main_rg_name
}


output "resource_group_id" {
  value = data.azurerm_resource_group.main_rg.id
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.main_rg.location
  description = "resourceGroupLocation"
}
