resource "azurerm_subnet" "md_subnet" {
    for_each = var.snet
  
  name = each.value.name
  resource_group_name = each.value.rgname
  address_prefixes = each.value.address_prefixes
  virtual_network_name = each.value.vnet

}

