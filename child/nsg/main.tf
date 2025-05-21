resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname
}

 