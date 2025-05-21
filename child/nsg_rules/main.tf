resource "azurerm_network_security_rule" "nsrule" {
  for_each                    = var.secrule
  name                        = each.value.name
  priority                    = each.value.prio
  direction                   = each.value.direction
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = each.value.dport
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = each.value.rgname
  network_security_group_name = each.value.nsgsecgrp
}
