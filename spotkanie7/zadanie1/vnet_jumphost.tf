resource "azurerm_virtual_network" "jumphost_vnet" {
  provider            = azurerm.spoke
  name                = local.jumphost_vnet_name
  address_space       = local.jumphost_vnet_address_space
  resource_group_name = data.azurerm_resource_group.spoke.name
  location            = data.azurerm_resource_group.spoke.location
}

resource "azurerm_subnet" "jumphost_vnet_sub01" {
  provider             = azurerm.spoke
  name                 = local.jumphost_vnet_subnet01_name
  address_prefixes     = local.jumphost_vnet_subnet01_address_space
  resource_group_name  = data.azurerm_resource_group.spoke.name
  virtual_network_name = azurerm_virtual_network.jumphost_vnet.name
}


resource "azurerm_virtual_network_peering" "hub_vnet_to_jumphost_vnet" {
  provider                  = azurerm.hub
  name                      = "${local.hub_vnet_name}-to-${local.jumphost_vnet_name}"
  resource_group_name       = data.azurerm_resource_group.hub.name
  virtual_network_name      = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.jumphost_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "jumphost_vnet_to_hub_vnet" {
  provider                  = azurerm.spoke
  name                      = "${local.jumphost_vnet_name}-to-${local.hub_vnet_name}"
  resource_group_name       = data.azurerm_resource_group.spoke.name
  virtual_network_name      = azurerm_virtual_network.jumphost_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
