data "azurerm_network_interface" "datanicblock" {
    for_each = var.lvm
  name                = each.value.nic_key
  resource_group_name = each.value.rgname

}


