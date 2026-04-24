module "rg" {
source = "../child module/rg"
rg-name = "sharma-rg"
}

module "vnet" {
  depends_on = [ module.rg ]
source = "../child module/vnet"
vnet-name = "sharma-vnet"
rg-name = "sharma-rg"
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../child module/subnet"
  subnet-name = "frontend-subnet"
  rg-name = "sharma-rg"
  vnet-name = "sharma-vnet"
nsg_id = "/subscriptions/db443927-390d-4e00-aac6-f5fa50dd047f/resourcegroups/sharma/providers/Microsoft.Network/networkSecurityGroups/sharma-nsg"

#module.nsg.nsg_id


  }

module "nsg" {
  depends_on = [ module.rg ]
  source = "../child module/nsg"
  nsg-name = "frontend-nsg"
  rg-location = "central india"
  rg-name = "sharma-rg"
}

module "nic" {
  depends_on = [ module.rg ]
  source = "../child module/nic"
  nic-name = "yoginic"
  nic-location = "central india"
  rg-name = "sharma-rg"
  subnet_id = module.subnet.subnet_id
pip_id = module.pip.pip_id

}

module "pip" {
  depends_on = [ module.rg ]
  source = "../child module/pip"
  pip-name = "pip"
  rg-location = "central india"
  rg-name = "sharma-rg"
  
}

module "vm" {
  depends_on = [ module.nic ]
  source = "../child module/vm"
  vm-name = "frontend-vm"
  network_interface_ids = module.nic.nic_id

}