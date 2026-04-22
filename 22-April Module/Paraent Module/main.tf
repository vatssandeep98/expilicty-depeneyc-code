module "rg" {
source = "../child module/rg"
rg-name = "yogika-rg"
}

module "vnet" {
  depends_on = [ module.rg ]
source = "../child module/vnet"
vnet-name = "yogika-vnet"
rg-name = "yogika-rg"
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../child module/subnet"
  subnet-name = "yogika-subnet"
  rg-name = "yogika-rg"
  vnet-name = "yogika-vnet"
  }

module "nsg" {
  depends_on = [ module.rg ]
  source = "../child module/nsg"
  nsg-name = "yoginsgwale"
  rg-location = "east us"
  rg-name = "yogika-rg"
}

module "nic" {
  depends_on = [ module.rg ]
  source = "../child module/nic"
  nic-name = "yoginic"
  nic-location = "east us"
  rg-name = "yogika-rg"
  subnet_id = module.subnet.id
}

module "pip" {
  depends_on = [ module.rg ]
  source = "../child module/pip"
  pip-name = "yogipipwale"
  rg-location = "east us"
  rg-name = "yogika-rg"
  
}

module "vm" {
  depends_on = [ module.nic ]
  source = "../child module/vm"
  vm-name = "yogivm"
  network_interface_ids = network_interface_ids.id
}