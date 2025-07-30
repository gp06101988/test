terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "sentinel-test-rg"
  location = "westeurope"
}

# Uncomment to test failure
# resource "azurerm_public_ip" "test" {
#   name                = "sentinel-publicip"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   allocation_method   = "Static"
# }
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "gpb5kor" # Replace with your Terraform Cloud org name
    workspaces {
      name = "test" # Replace with your Terraform Cloud workspace name
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "sentinel-test-rg"
  location = "westeurope"
}

# Uncomment this block to test Sentinel failure
# resource "azurerm_public_ip" "test" {
#   name                = "sentinel-publicip"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   allocation_method   = "Static"
# }
