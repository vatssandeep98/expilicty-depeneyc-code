resource "azurerm_linux_virtual_machine" "vm" {
  depends_on = [ azurerm_network_interface.nic ]
  name                = "patluvm"
  resource_group_name = "patlu-rg"
  location            = "central india"
  size                = "Standard_B2as_v2"
  admin_username      = "patluvm"
  admin_password = "sachin@22113344"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
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