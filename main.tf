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
# COSMOS DB ACCOUNT
############################################

# Cosmos DB Account (Free Tier Enabled)
resource "azurerm_cosmosdb_account" "db" {
  name                = "sahil-resume-cosmosdb"
  location            = azurerm_resource_group.rg.location # update if your RG local variable name differs
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  free_tier_enabled = true # Keeps the first 1,000 RU/s and 25GB storage completely free

  consistency_policy {
    consistency_level = "Eventual"
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}

# Cosmos DB SQL Database
resource "azurerm_cosmosdb_sql_database" "database" {
  name                = "AzureResume"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.db.name
}

# Cosmos DB Container
resource "azurerm_cosmosdb_sql_container" "container" {
  name                = "Counter"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_sql_database.database.name
  partition_key_paths = ["/id"]
  throughput          = 400
}

############################################
# OUTPUTS
############################################

output "static_web_app_default_hostname" {
  value = azurerm_static_web_app.personalwebsite.default_host_name
}
