terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6eb6ee21-8952-4718-9243-5a0101ee200e"
}

variable "sachin_name" {}
variable "sachin_location" {}
variable "sachin_storage" {}


resource "azurerm_resource_group" "svips" {
  count    = length(var.sachin_name)
  name     = var.sachin_name[count.index]
  location = var.sachin_location[count.index]
}

resource "azurerm_storage_account" "testvips" {
  depends_on               = [azurerm_resource_group.svips]
  count                    = length(var.sachin_storage)
  name                     = var.sachin_storage[count.index]
  resource_group_name      = var.sachin_name[count.index]
  location                 = var.sachin_location[count.index]
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Vipin is our Mentor
#add new line


