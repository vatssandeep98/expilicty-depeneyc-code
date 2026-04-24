resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm-name
  resource_group_name = "sharma-rg"
  location            = "central india"
  size                = "Standard_B2as_v2"
  admin_username      = "yogiadmin"
  admin_password =    "yogi@221133"

  network_interface_ids = [var.network_interface_ids]
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