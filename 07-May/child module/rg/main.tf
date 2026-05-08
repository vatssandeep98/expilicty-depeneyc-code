resource "azurerm_resource_group" "rg" {
name = var.rg-name
location = var.rg-location
}

#YE Variable Declare kiya hai RG KA 
variable "rg-name" {}    
variable "rg-location" {}