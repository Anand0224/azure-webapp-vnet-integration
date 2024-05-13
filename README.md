# win-web-app-vnet-int
This git repo is configured to create Azure windows web app and configure vnet integration using terraform.
# Terraform Provider: azurerm

The following Azure resources are created upon successful execution.
  * Resource Group
  * Virtual Network
  * Private endpoints
  * Appservice plan 
  * Frontend Web App with vnet integration
  * Staging Deployment slot with vnet integration

## Prerequisite

Before using this module, you must have the following:
- Azure subscription
- Terraform must be installed locally and terraform directory must be set in the path variable.

Azure web app is created according to the following variables. Change them to desired value if required

| Variable Name | Description | Default Value |
|------------|------------|--------------|
| resource_group_location | enter preferred location | East US |
| prefix | azure resource prefix | ak-demo  |
| sku_name | sku name | P1v2  |



## Usage

- Clone github repo: https://github.com/Anand0224/win-web-app-vnet-int
- Login to azure using commandline. Download azure CLI: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
- Run the following terraform commands to create azure resources. **Note**: Add terraform installed directory in the path variable
  	- terraform init
   - terraform plan -out plan-to-apply
   - terraform apply plan-to-apply

## Output
Upon successful execution these Azure resources will be created.

![image](https://github.com/Anand0224/win-web-app-vnet-int/assets/90755307/5a666e1b-b031-477a-8daa-928dde207a11)

- Azure Web app vnet integration
  
![image](https://github.com/Anand0224/win-web-app-vnet-int/assets/90755307/94163785-f9b8-49c3-b58a-52556ba33509)


- Azure app service slot vnet integration
  
![image](https://github.com/Anand0224/win-web-app-vnet-int/assets/90755307/8806c510-9e67-4d57-b447-be73a60d2336)


- Deployment slots
  
![image](https://github.com/Anand0224/win-web-app-vnet-int/assets/90755307/375f7a44-96d5-466b-ba43-bd36175ec02e)

