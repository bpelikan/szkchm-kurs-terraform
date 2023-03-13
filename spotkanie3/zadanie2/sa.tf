resource "azurerm_storage_account" "storage_account_01" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.main_rg.name
  location                 = data.azurerm_resource_group.main_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}