mvrgname = {

  rg1 = {

    name     = "yuvi_resouce_group"
    location = "West US"

  }

}

mdvnet = {

  vnet1 = {

    name          = "vnet_ho"
    location      = "East US"
    rgname        = "yuvi_resouce_group"
    address_space = ["10.0.0.0/16"]
  }
}

md_subnet = {

  subnet1 = {

    name             = "subnetyuvi1"
    rgname           = "yuvi_resouce_group"
    vnet             = "vnet_ho"
    address_prefixes = ["10.0.1.0/24"]

  }

  subnet2 = {
    name             = "subnetyuvi2"
    rgname           = "yuvi_resouce_group"
    vnet             = "vnet_ho"
    address_prefixes = ["10.0.2.0/24"]

  }
}

nics = {
  nic1 = {
    name       = "front-nic"
    location   = "East US"
    rgname     = "yuvi_resouce_group"
    subnet_key = "subnetyuvi1"
    vnet       = "vnet_ho"
    pip        = "frontpip"
  }
  nic2 = {
    name       = "back-nic"
    location   = "East US"
    rgname     = "yuvi_resouce_group"
    subnet_key = "subnetyuvi2"
    vnet       = "vnet_ho"
    pip        = "backpip"
  }
}

lvmx = {

  lvm1 = {
    name     = "linuxfrontend"
    rgname   = "yuvi_resouce_group"
    location = "East Us"
    size     = "Standard_B1ms"
    adm_usr  = "azureuser"
    adm_pwd  = "Welcome@$#2025"
    nic_key  = "front-nic"
  }

  lvm2 = {
    name     = "linuxbackend"
    rgname   = "yuvi_resouce_group"
    location = "East Us"
    size     = "Standard_B1ms"
    adm_usr  = "azureuser"
    adm_pwd  = "Welcome@$#2025"
    nic_key  = "back-nic"
  }
}

pips = {
  pip_1 = {
    name     = "frontpip"
    rgname   = "yuvi_resouce_group"
    location = "East US"

  }
  pip_2 = {
    name     = "backpip"
    rgname   = "yuvi_resouce_group"
    location = "East US"

  }
}

nsgv = {
  nsg1 = {

    name     = "nsgsec"
    location = "eastus"
    rgname   = "yuvi_resouce_group"
  }

}

securityrules = {
  sshrule = {

    name      = "ssh"
    rgname    = "yuvi_resouce_group"
    nsgsecgrp = "nsgsec"
    direction = "Inbound"
    dport     = "22"
    prio      = 100


  }
  httprule = {

    name      = "http"
    rgname    = "yuvi_resouce_group"
    nsgsecgrp = "nsgsec"
    direction = "Inbound"
    dport     = "80"
    prio      = 110


  }
}

nsgsubassoc = {
  assoc1 = {
    nsg_key    = "nsgsec"
    subnet_key = "subnetyuvi1"
    vnet       = "vnet_ho"
    rgname     = "yuvi_resouce_group"
  }
  assoc2 = {
    nsg_key    = "nsgsec"
    subnet_key = "subnetyuvi2"
    vnet       = "vnet_ho"
    rgname     = "yuvi_resouce_group"
  }
}
