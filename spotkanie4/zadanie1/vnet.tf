resource "azurerm_virtual_network" "hub_vnet" {
  name                = local.hub_vnet_name
  address_space       = local.hub_vnet_address_space
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
}




resource "azurerm_virtual_network" "spoke_vnet_jumphost" {
  name                = local.jumphost_vnet_name
  address_space       = local.jumphost_vnet_address_space
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
}




resource "azurerm_virtual_network" "spoke_vnet_app" {
  name                = local.app_vnet_name
  address_space       = local.app_vnet_address_space
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
}

