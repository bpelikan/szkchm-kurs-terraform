module "jumphost" {
  source = "./modules/vm"

  providers = {
    azurerm.vm = azurerm.shared
  }

  name                   = "${local.prefix}-jumphost-vm"
  rg_name                = data.azurerm_resource_group.rg.name
  location               = data.azurerm_resource_group.rg.location
  subnet_id              = azurerm_subnet.jumphost.id
  administrator_login    = "azureuser"
  administrator_password = var.vm_password
}
