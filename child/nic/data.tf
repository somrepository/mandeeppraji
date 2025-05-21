data "azurerm_subnet" "datasubnet" {
    for_each = var.childnic
  name                 = each.value.subnet_key
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rgname
}


data "azurerm_public_ip" "datapip" {
  for_each = var.childnic
  name                = each.value.pip
  resource_group_name = each.value.rgname
}

