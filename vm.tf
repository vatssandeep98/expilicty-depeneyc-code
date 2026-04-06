resource "azurerm_virtual_machine" "vm" {
  depends_on            = [azurerm_network_interface.nic]
  name                  = "samrat-vm"
  location              = "Central India"
  resource_group_name   = "sharma"
  network_interface_ids = [azurerm_network_interface.nic.id]  #yha par NIC ID refer ho rahi hai
   vm_size = "Standard_B2as_v2"
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "samrat-vm"
    admin_username = "samrat"
    admin_password = "Samrat@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
