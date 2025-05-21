module "rgs" {
  source = "../child/rg"
  rgname = var.mvrgname
}

module "public_ip" {
  depends_on = [module.rgs, module.subnet]
  source     = "../child/pip"
  pip        = var.pips
}

module "vnet" {
  depends_on = [module.rgs]
  source     = "../child/vnet"
  vnet       = var.mdvnet
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../child/subnet"
  snet       = var.md_subnet
}

module "nics" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../child/nic"
  childnic   = var.nics
}

module "virtualm" {
  depends_on = [module.nics, module.subnet]
  source     = "../child/vm"
  lvm        = var.lvmx
}

# output "public_ip_address" {
#     depends_on = [ module.public_ip ]
#   value = module.public_ip[each.key].ip_address
# }

module "nsgmodule" {
  depends_on = [module.rgs]
  source     = "../child/nsg"
  nsg        = var.nsgv
}

module "nsgrulemodule" {
  depends_on = [module.rgs, module.nsgmodule]
  source     = "../child/nsg_rules"
  secrule    = var.securityrules
}

module "nsgsubnetassoc" {
  depends_on = [module.subnet, module.nsgmodule, module.rgs]
  source     = "../child/nsg_subnet_association"
  nsgsubnetassoc = var.nsgsubassoc
}
