# Create Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Create Azure Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# Create Integration Subnet
resource "azurerm_subnet" "integrationsubnet" {
  name                 = var.integrationsubnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
}

# Create Endpoint Subnet
resource "azurerm_subnet" "endpointsubnet" {
  name                 = var.endpointsubnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Provision Frontend Web App
module "frontendwebapp" {
  source                    = "./modules/win_web_app"
  resource_group_location   = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  privateendpoint           = "${var.prefix}-frontend-webapp"
  os_type                   = "Windows"
  subnet_id                 = azurerm_subnet.endpointsubnet.id
  sku_name                  = "P1v2"
  isubnet                   = azurerm_subnet.integrationsubnet.id
}