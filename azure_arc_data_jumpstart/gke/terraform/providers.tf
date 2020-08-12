terraform {
  required_version = "~> 0.12"
  required_providers {
    google  = ">= 3.21"
    local   = "~> 1.4"
    azurerm = "~> 2.0.0"
  }
}

provider "google" {
  version     = "3.21"
  credentials = file(var.gcp_credentials_filename)
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}

provider "azurerm" {
  subscription_id = var.ARC_DC_SUBSCRIPTION
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}