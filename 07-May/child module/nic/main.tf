resource "azurerm_network_interface" "nic" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

variable "nic-name" {}
variable "location" {}
variable "rg-name" {}