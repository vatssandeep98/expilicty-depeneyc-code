resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm-name
  resource_group_name = "yogika-rg"
  location            = "east us"
  size                = "Standard_F2"
  admin_username      = "yogiadmin"
  admin_password =    "mera@naam@hai@kanhya"

  network_interface_ids = var.network_interface_ids
disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}