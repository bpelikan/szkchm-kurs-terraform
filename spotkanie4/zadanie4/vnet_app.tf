
resource "azurerm_virtual_network" "app_vnet" {
  name                = local.app_vnet_name
  address_space       = local.app_vnet_address_space
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
}

resource "azurerm_subnet" "app_vnet_sub01" {
  name                 = local.app_vnet_subnet01_name
  address_prefixes     = local.app_vnet_subnet01_address_space
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
}

resource "azurerm_network_security_group" "app_nsg" {
  name                = "${local.app_prefix}-nsg-app"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
}

resource "azurerm_subnet_network_security_group_association" "app_nsg" {
  subnet_id                 = azurerm_subnet.app_vnet_sub01.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}