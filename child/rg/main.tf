resource "azurerm_resource_group" "rgmonday1" {
    for_each = var.rgname

    name = each.value.name
    location = each.value.location
  
}