resource "azurerm_virtual_network" "hub_vnet" {
  provider            = azurerm.hub
  name                = "${local.prefix}-hub-vnet"
  address_space       = [local.hub_vnet_address_space]
  resource_group_name = data.azurerm_resource_group.hub.name
  location            = data.azurerm_resource_group.hub.location
}

resource "azurerm_subnet" "hub_vnet_sub01_fw_mngm" {
  provider             = azurerm.hub
  name                 = "AzureFirewallManagementSubnet"
  address_prefixes     = [local.hub_vnet_sub01_fw_mngm_address_space]
  resource_group_name  = data.azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}

resource "azurerm_subnet" "hub_vnet_sub02_fw" {
  provider             = azurerm.hub
  name                 = "AzureFirewallSubnet"
  address_prefixes     = [local.hub_vnet_sub02_fw_address_space]
  resource_group_name  = data.azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}
