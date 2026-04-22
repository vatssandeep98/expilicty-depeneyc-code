resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg-name
   location            = var.rg-location
  resource_group_name = var.rg-name

  security_rule {
    name                       = "yogi-karule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}