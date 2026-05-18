module "rg" {
  source          = "../Child/resource_group"
  resource_groups = var.rg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../Child/vnet"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../Child/subnet"
  subnet     = var.subnet
}

module "nsg" {
  depends_on = [ module.rg ]
  source = "../Child/nsg"
  nsg = var.nsg
}

module "pip" {
  source = "../Child/public_ip"
  pip = var.pip

}

module "nic" {
  source = "../Child/nic"
  nic    = var.nic
}

module "vm" {
  source = "../Child/virtual_machine"
  vm     = var.vm
}



