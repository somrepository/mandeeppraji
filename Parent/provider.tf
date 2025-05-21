terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.29.0"
    }
  }

  backend "azurerm" {
    storage_account_name = "stgaccountterraform"
    container_name = "tfstate"
    key = "backup.tfstate"
    resource_group_name = "terraform-rg"
  }
}

provider "azurerm" {
    features {}
    subscription_id = "f9182cf3-79c7-402d-a90b-c4ec97f72f88"
}
  
