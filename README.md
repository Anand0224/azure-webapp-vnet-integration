# win-web-app-vnet-int
Azure windows web app creation with vnet integration using Terraform
# Terraform Module: azurerm

The following resources are created upon successful execution.
  * Create Azure Resource Group
  * Create Azure Virtual Network
  * Create Integration Subnet
  * Create Endpoint Subnet
  * Provision Frontend Web App with vnet integration
  * Create Deployment slot pre-production

## Prerequisites

Before using this module, you must have the following:
- Azure subscription
- Terraform installed locally

## Usage

- Clone github repo: https://github.com/Anand0224/terraform
- Login to azure using commandline. Download azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
- Run the following terraform commands to create azure resources.
  	- terraform init
   - terraform plan -out plan-to-apply
   - terraform apply plan-to-apply

## output
Azure resources:
![image](https://github.com/Anand0224/terraform/assets/90755307/e2821ce7-4560-4643-8cbe-42934be9f437)

Web app with vnet integration
![image](https://github.com/Anand0224/terraform/assets/90755307/18a77d1c-318b-4573-b5a9-f4317f20a197)

deployment slots
![image](https://github.com/Anand0224/terraform/assets/90755307/dde009cf-86e7-4ba5-a6e0-34ef0daaf049)


