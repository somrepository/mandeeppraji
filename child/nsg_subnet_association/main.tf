resource "azurerm_subnet_network_security_group_association" "example" {
    for_each = var.nsgsubnetassoc
  subnet_id                 = data.azurerm_subnet.datasubnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgdata[each.key].id
}

data "azurerm_network_security_group" "nsgdata" {
    for_each = var.nsgsubnetassoc
  name                = each.value.nsg_key
  resource_group_name = each.value.rgname
}

data "azurerm_subnet" "datasubnet" {
    for_each = var.nsgsubnetassoc
  name                 = each.value.subnet_key
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rgname
}