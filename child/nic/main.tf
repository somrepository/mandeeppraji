resource "azurerm_network_interface" "nic" {
  for_each = var.childnic
  
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.datapip[each.key].id
  }
}