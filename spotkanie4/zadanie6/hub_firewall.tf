resource "azurerm_public_ip" "hub_fw_mngm_pip" {
  name                = "${local.hub_prefix}-fw-mngm-pip"
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip" "hub_fw_pip" {
  name                = "${local.hub_prefix}-fw-pip"
  resource_group_name = data.azurerm_resource_group.main_rg.name
  location            = data.azurerm_resource_group.main_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_firewall_policy" "hub_fw" {
  name                = "${local.hub_prefix}-fw-policy"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  sku                 = "Basic"
}

resource "azurerm_firewall_policy_rule_collection_group" "hub_fw_rcg" {
  name               = "${local.hub_prefix}-fw-rcg"
  firewall_policy_id = azurerm_firewall_policy.hub_fw.id
  priority           = 500


  network_rule_collection {
    name     = "${local.hub_prefix}-fw-nrc"
    priority = 400
    action   = "Allow"
    dynamic "rule" {
      for_each = local.hub_fw_rules

      content {
        name                  = rule.key
        protocols             = rule.value.protocols
        source_addresses      = rule.value.source_addresses
        destination_addresses = rule.value.destination_addresses
        destination_ports     = rule.value.destination_ports
      }
    }
  }
}


resource "azurerm_firewall" "hub_fw" {
  name                = "${local.hub_prefix}-fw"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  firewall_policy_id  = azurerm_firewall_policy.hub_fw.id
  sku_name            = "AZFW_VNet"
  sku_tier            = "Basic"

  management_ip_configuration {
    name                 = "${local.hub_prefix}-fw-mgmt-ipconf"
    subnet_id            = azurerm_subnet.hub_vnet_sub01_fw_mngm.id
    public_ip_address_id = azurerm_public_ip.hub_fw_mngm_pip.id
  }

  ip_configuration {
    name                 = "${local.hub_prefix}-fw-ipconfig"
    subnet_id            = azurerm_subnet.hub_vnet_sub02_fw.id
    public_ip_address_id = azurerm_public_ip.hub_fw_pip.id
  }
}
