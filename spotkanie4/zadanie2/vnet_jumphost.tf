resource "azurerm_virtual_network" "jumphost_vnet" {
  name                = local.jumphost_vnet_name
  address_space       = local.jumphost_vnet_address_space
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
}

resource "azurerm_subnet" "jumphost_vnet_sub01" {
  name                 = local.jumphost_vnet_subnet01_name
  address_prefixes     = local.jumphost_vnet_subnet01_address_space
  resource_group_name  = data.azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.jumphost_vnet.name
}

resource "azurerm_network_security_group" "jumphost_nsg_vm" {
  name                = "${local.jumphost_prefix}-nsg-vm"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "jumphost_nsg_vm" {
  subnet_id                 = azurerm_subnet.jumphost_vnet_sub01.id
  network_security_group_id = azurerm_network_security_group.jumphost_nsg_vm.id
}