data "azurerm_resource_group" "main_rg" {
  name = var.main_rg_name
}

data "azurerm_client_config" "current" {
}



output "resource_group_id" {
  value = data.azurerm_resource_group.main_rg.id
}

output "resource_group_location" {
  value       = data.azurerm_resource_group.main_rg.location
  description = "resourceGroupLocation"
}


output "client_config_client_id" {
  value = data.azurerm_client_config.current.client_id
}
output "client_config_tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}
output "client_config_subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}
output "client_config_object_id" {
  value = data.azurerm_client_config.current.object_id
}

