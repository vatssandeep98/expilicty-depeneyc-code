resource "azurerm_public_ip" "pip" {
  name                = var.pip-name
  resource_group_name = var.rg-name
  location            = var.pip-location
    allocation_method   = "Static"

  }

  variable "pip-name" {}
  variable "rg-name" {}
  variable "pip-location" {}