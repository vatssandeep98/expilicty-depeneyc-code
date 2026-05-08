module "rg" {

#JHA SE RG KE CHILD KO CALL KRANA HAI USKI LOCATION
source = "../child module/rg"
rg-name = "frontend-rg"
rg-location = "central india"

}

module "vnet" {
depends_on = [ module.rg ]
source = "../child module/vnet"
vnet-name = "frontend-vnet"
vnet-location = "central india"
rg-name = "frontend-rg"
address_space = ["10.0.0.0/16"]
}

module "subnet" {
    depends_on = [ module.vnet ]
  source = "../child module/subnet"
  subnet-name = "frontend-subnet"
  resource_group_name = "frontend-rg"
  virtual_network_name = "frontend-vnet"
  address_prefixes = ["10.0.0.0/24"]
}

module "nsg" {
  depends_on = [ module.rg ]
  source = "../child module/nsg"
  nsg-name = "frontend-nsg"
  rg-location = "central india"
  rg-name = "frontend-rg"
  
}

module "nic" {
  depends_on = [ module.rg ]
  source = "../child module/nic"
  nic-name = "frontend-nic"
  location = "central india"
  rg-name = "frontend-rg"
  
  }

  module "pip" {
    depends_on = [ module.rg ]
    source = "../child module/pip"
pip-name = "frontend-pip"
rg-name = "frontend-rg"
pip-location = "central india"
  }

  module "vm" {
    depends_on = [ module.rg, module.nic ]
    source = "../child module/vm"
    vm-name = "frontend-vm"
    rg-name = "frontend-rg"
    vm-location = "central india"
  }