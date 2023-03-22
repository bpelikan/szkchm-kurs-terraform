resource "azurerm_network_interface" "jumphost-nic" {
  name                = "${local.jumphost_prefix}-nic"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name

  ip_configuration {
    name                          = "${local.jumphost_prefix}-nic-ipconfig"
    subnet_id                     = azurerm_subnet.jumphost_vnet_sub01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jumphost-pip.id
  }
}

resource "azurerm_public_ip" "jumphost-pip" {
  name                = "${local.jumphost_prefix}-pip"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  allocation_method   = "Static"
}

output "jumphost_pip_value" {
  value = azurerm_public_ip.jumphost-pip.ip_address
}

resource "azurerm_linux_virtual_machine" "jumphost-vm" {
  name                = "${local.jumphost_prefix}-vm"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  size                = "Standard_F2"

  disable_password_authentication = false
  admin_username                  = var.username
  admin_password                  = var.password

  network_interface_ids = [
    azurerm_network_interface.jumphost-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

