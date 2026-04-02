# Example provider configuration with a remote state backend.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Remote state backend using Azure Storage.
  backend "azurerm" {
    resource_group_name  = "rg-devops-dr-prod-westus-01"
    storage_account_name = "stdevopsdrprodwestus01"
    container_name       = "example-infratfstate"
    key                  = "example-infratfstate"
    subscription_id      = "078a9949-64e1-486b-911b-2ccd2876ecb1"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "078a9949-64e1-486b-911b-2ccd2876ecb1"
}
