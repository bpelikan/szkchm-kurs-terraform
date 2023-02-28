resource "azurerm_virtual_network" "vnet01" {
  name                = local.vnet_name_s22
  address_space       = var.vnet_address_space
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
}


resource "azurerm_subnet" "vnet01_subnet01" {
  name                 = local.subnet_name_s22
  address_prefixes     = var.subnet_address_prefixes
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
}