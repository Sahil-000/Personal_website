############################################
# PROVIDER CONFIGURATION
############################################

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


############################################
# VARIABLES
############################################

variable "location" {
  description = "Azure region"
  default     = "Australia East"
}

variable "resource_group_name" {
  description = "Resource group name"
  default     = "rg-personalwebsite"
}

variable "static_web_app_name" {
  description = "Static Web App name"
  default     = "PersonalWebsite"
}


############################################
# RESOURCE GROUP
############################################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


############################################
# STATIC WEB APP
############################################

resource "azurerm_static_web_app" "personalwebsite" {
  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = "eastasia"
  sku_tier            = "Free"
}


############################################
# OUTPUTS
############################################

output "static_web_app_default_hostname" {
  value = azurerm_static_web_app.personalwebsite.default_host_name
}
