data "azurerm_resource_group" "main_rg" {
  name = "chm-student22"
}


output "resource_group_id" {
  value = data.azurerm_resource_group.main_rg.id
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.main_rg.location
  description = "resourceGroupLocation"
}

