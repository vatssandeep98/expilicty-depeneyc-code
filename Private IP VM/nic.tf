resource "azurerm_network_interface" "nic" {
  name                = "motunic"
  location            = "central india"
  resource_group_name = "motu-rg"

  ip_configuration {
    name                          = "internal"
   subnet_id                     = azurerm_subnet.subnet.id
  private_ip_address_allocation = "Dynamic"
  }
}

output "nic" {
  value = azurerm_network_interface.nic.id
}


