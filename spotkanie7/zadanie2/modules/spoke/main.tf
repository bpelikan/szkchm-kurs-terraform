resource "azurerm_virtual_network" "vnet" {
  provider            = azurerm.spoke
  name                = "${local.prefix}-vnet"
  address_space       = [var.vnet_address_space]
  resource_group_name = var.rg_name
  location            = var.location
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  provider             = azurerm.spoke
  name                 = "${local.prefix}-sbn-${each.key}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_space]
}




resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  provider                  = azurerm.hub
  name                      = "${var.hub_vnet_name}-to-${azurerm_virtual_network.vnet.name}"
  resource_group_name       = var.hub_rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  provider                  = azurerm.spoke
  name                      = "${azurerm_virtual_network.vnet.name}-to-${var.hub_vnet_name}"
  resource_group_name       = var.rg_name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

