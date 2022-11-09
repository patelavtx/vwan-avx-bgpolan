provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
      version = "2.24.0"
    }
  }
}