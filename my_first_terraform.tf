# terraform block with provider information includes service , version etc ... #
terraform {
  required_providers { 
      azurerm = {
      source = "hashicorp/azurerm"
      version = "2.66.0"
   }
    
  }
}

# Authenticating to Azure from terraform using the service principal and Client secret #
provider "azurerm" {
    features {}
    client_id = "3d37bf1f-1b26-47ad-9e90-9e0a28f6d0b8"
    client_secret = "HNk.-O0vCF4_vO6xC9F~QT-EjUhAB348zZ"
    tenant_id = "105c24b7-cab2-471b-80b4-0b2d40037b01"
    subscription_id = "b71589c6-3061-403e-9600-569f06662f20"  
}

# Creating Resource group in Azure #
resource "azurerm_resource_group" "rg" {
    name = "RSG_terraform"
    location = "East US"
    tags = {
      "Environment" = "dev"
    }
}

# Creating Virtual network in Azure #
resource "azurerm_virtual_network" "vnet" {
    name = "Vnet_terraform"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = [ "10.125.0.0/16" ]
    tags = {
      "Environment" = "dev"
    }
}
