resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.lvm
  name                = each.value.name
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.adm_usr

  admin_password =   each.value.adm_pwd    
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.datanicblock[each.key].id]


  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}