resource "azurerm_subnet" "subnet" {
  name                 = var.subnet-name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = ["10.0.1.0/24"]
}

