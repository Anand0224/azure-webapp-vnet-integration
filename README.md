# win-web-app-vnet-int
Using Terraform creating Azure windows web app and vnet integration
# Terraform Provider: azurerm

The following Azure resources are created upon successful execution.
  * Resource Group
  * Virtual Network
  * Private endpoints
  * Appservice plan 
  * Frontend Web App with vnet integration
  * Pre-production Deployment slot with vnet integration

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

## Output
Azure resources:

![image](https://github.com/Anand0224/terraform/assets/90755307/14272f76-c8d2-4f15-acc9-0cb606f2f6f6)


- Web app with vnet integration
  
![image](https://github.com/Anand0224/terraform/assets/90755307/853cbd35-bed9-48b5-901e-5124f0c38d1b)

- Web app pre-production with vnet integration
  
![image](https://github.com/Anand0224/win-web-app-vnet-int/assets/90755307/7f57995f-9f87-4062-8984-630ce4acaf80)

- Deployment slots
  
![image](https://github.com/Anand0224/terraform/assets/90755307/c896f3f0-ac5b-4a7d-8426-72f86b67ae25)
