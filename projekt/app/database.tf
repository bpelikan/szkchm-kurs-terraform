module "psql" {
  source = "./modules/psql"

  providers = {
    azurerm.psql = azurerm.app
  }

  name                = "${local.prefix}-psql"
  subnet_id           = azurerm_subnet.data.id
  administrator_login = "psqladmin"
  environment         = var.environment
  rg = {
    name     = data.azurerm_resource_group.rg.name
    location = data.azurerm_resource_group.rg.location
  }
  vnet = {
    id   = azurerm_virtual_network.vnet.id
    name = azurerm_virtual_network.vnet.name
  }
  databases = {
    "default" = "default"
  }
}


moved {
  from = random_password.password
  to = module.psql.random_password.password[0]
}

moved {
  from = azurerm_postgresql_flexible_server.psql
  to = module.psql.azurerm_postgresql_flexible_server.psql
}

moved {
  from = azurerm_private_dns_zone.zones["psql"]
  to = module.psql.azurerm_private_dns_zone.zone
}

moved {
  from = azurerm_private_dns_zone_virtual_network_link.zones["psql"]
  to = module.psql.azurerm_private_dns_zone_virtual_network_link.link
}