terraform {
  required_version = "3.66.0"
}

provider "azurerm" {
  features {}
}
# backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "devxyzstorageaccount"
    container_name       = "devconatiner"
    key                  = "devkeyvault.tfstate"
  }
}








