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




resource "azurerm_virtual_network_peering" "hub_vnet_to_jumphost_vnet" {
  name                      = "${azurerm_virtual_network.hub_vnet.name}-to-${azurerm_virtual_network.jumphost_vnet.name}"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.jumphost_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "jumphost_vnet_to_hub_vnet" {
  name                      = "${azurerm_virtual_network.jumphost_vnet.name}-to-${azurerm_virtual_network.hub_vnet.name}"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.jumphost_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}




resource "azurerm_virtual_network_peering" "hub_vnet_to_app_vnet" {
  name                      = "${azurerm_virtual_network.hub_vnet.name}-to-${azurerm_virtual_network.app_vnet.name}"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.app_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "app_vnet_to_hub_vnet" {
  name                      = "${azurerm_virtual_network.app_vnet.name}-to-${azurerm_virtual_network.hub_vnet.name}"
  resource_group_name       = data.azurerm_resource_group.main_rg.name
  virtual_network_name      = azurerm_virtual_network.app_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_private_dns_zone_virtual_network_link" "hub_link_app_cae" {
  name                  = "${local.hub_prefix}-link_app_cae"
  resource_group_name   = data.azurerm_resource_group.main_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.app_cae.name
  virtual_network_id    = azurerm_virtual_network.hub_vnet.id
}