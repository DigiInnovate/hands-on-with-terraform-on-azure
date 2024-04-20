terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "nimbus-adv"

    workspaces {
      name = "hands-on-with-terraform-on-azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-c48dd547-hands-on-with-terraform-on-azure"
  location = "East US"
}

module "securestorage" {
  source               = "app.terraform.io/nimbus-adv/securestorage/azurem"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "stgicar89643"
}