resource "azurerm_subnet" "subnet" {
  name                 = var.subnet-name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}


variable "subnet-name" {}
variable "resource_group_name" {}
variable "virtual_network_name" {}
variable "address_prefixes" {}
