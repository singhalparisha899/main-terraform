terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-parisha"
    storage_account_name = "riyastorageaccount"
    container_name       = "tfstate"
    key                  = "virtual_machine.tfstate"
  }
}

provider "azurerm" {
  features {}
}