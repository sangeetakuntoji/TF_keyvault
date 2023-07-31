terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }
}

provider "azurerm" {
  features {}
}
# backend configuration
terraform {
  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "devxyzstorageaccount1"
    container_name       = "devconatiner"
    key                  = "devkeyvault.tfstate"
  }
}








