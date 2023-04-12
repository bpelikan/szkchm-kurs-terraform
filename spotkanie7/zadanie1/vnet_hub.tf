resource "azurerm_virtual_network" "hub_vnet" {
  name                = local.hub_vnet_name
  address_space       = local.hub_vnet_address_space
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
}

resource "azurerm_subnet" "hub_vnet_sub01_fw_mngm" {
  name                 = "AzureFirewallManagementSubnet"
  address_prefixes     = local.hub_vnet_sub01_fw_mngm_address_space
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}

resource "azurerm_subnet" "hub_vnet_sub02_fw" {
  name                 = "AzureFirewallSubnet"
  address_prefixes     = local.hub_vnet_sub02_fw_address_space
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
}