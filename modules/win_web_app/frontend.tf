# Define Azure App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "${var.prefix}-asp"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
}

# Create Azure Windows Web App
resource "azurerm_windows_web_app" "frontendwebapp" {
  name                = "${var.prefix}-frontend-webapp"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {}

  app_settings = {
    "WEBSITE_DNS_SERVER" : "168.63.129.16",
    "WEBSITE_VNET_ROUTE_ALL" : "1"
  }
}

# Create Azure Private DNS Zone
resource "azurerm_private_dns_zone" "dnsprivatezone" {
  name                = "ak-privatelink.azurewebsites.net"
  resource_group_name = var.resource_group_name
}

# Create Azure Private Endpoint
resource "azurerm_private_endpoint" "privateendpoint" {
  name                = var.privateendpoint
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezone.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = azurerm_windows_web_app.frontendwebapp.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}

#Create Deployment slot pre-production
resource "azurerm_windows_web_app_slot" "deployment-slot" {
  name           = "pre-production"
  app_service_id = azurerm_windows_web_app.frontendwebapp.id

  site_config {}
}

#Create App service virtual network connection
resource "azurerm_app_service_virtual_network_swift_connection" "network-swift-connection" {
  app_service_id = azurerm_windows_web_app.frontendwebapp.id
  subnet_id      = var.isubnet
}

#Create App service slot virtual network connection
resource "azurerm_app_service_slot_virtual_network_swift_connection" "slot-network-swift-connection" {
  slot_name      = azurerm_windows_web_app_slot.deployment-slot.name
  app_service_id = azurerm_windows_web_app.frontendwebapp.id
  subnet_id      = var.isubnet
}



