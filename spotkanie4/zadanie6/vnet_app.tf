
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

resource "azurerm_private_dns_zone_virtual_network_link" "app_link_app_cae" {
  name                  = "${local.app_prefix}-link_app_cae"
  resource_group_name   = data.azurerm_resource_group.main_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.app_cae.name
  virtual_network_id    = azurerm_virtual_network.app_vnet.id
}


resource "azurerm_route_table" "app" {
  name                = "${local.app_prefix}-routetable"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name

  route {
    name                   = "to-${local.jumphost_prefix}"
    address_prefix         = local.jumphost_vnet_address_space[0]
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.hub_fw.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "app" {
  subnet_id      = azurerm_subnet.app_vnet_sub01.id
  route_table_id = azurerm_route_table.app.id
}