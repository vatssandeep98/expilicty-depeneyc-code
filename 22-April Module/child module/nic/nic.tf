resource "azurerm_network_interface" "nic" {
  name                = var.nic-name
  location            = var.nic-location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}