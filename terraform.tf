terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0" # Specify a compatible version
    }
  }
  required_version = ">= 1.0.0" # Specify a compatible Terraform version
}

provider "azurerm" {
  features {} # Required for the AzureRM provider
}