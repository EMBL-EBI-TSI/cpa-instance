variable "name" {
  default = "tsiinstance"
  description = "The name of the deployment"
}

variable "username" {
  default = "clouduser"
  description = "The desired username on the new instance"
}

variable "subnet_id" {
  description = "The id of the subnet as defined by the cpa-network appliance"
}

variable "resource_group" {
  description = "The resource group to deploy to"
}

variable "machine_type" {
  default = "Standard_DS1_v2"
  description = "Machine type (flavor)"
}

variable "profile_public_key" {
  description = "The public SSH key to be injected in the vm"
}

# Azure specific vars

variable "region" {
  description = "Azure region to deploy in"
}

# For help on getting the 4 variables below, see: https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html#creating-a-service-principal-in-the-azure-portal

#variable "subscription_id" {
#  description = "ID of the Azure subscription to use"
#}
#
#variable "client_id" {
#  description = "ID of the Azure client to use"
#}
#
#variable "client_secret" {
#  description = "Value of the Azure client secret"
#}
#
#variable "tenant_id" {
#  description = "ID of the Azure tenant to use"
#}

# OS image variables
variable "os_image_publisher" {
  description = "name of OS publisher"
  default = "Canonical"
}

variable "os_image_offer" {
  description = "name of OS offer"
  default = "UbuntuServer"
}

variable "os_image_sku" {
  description = "SKU of OS offer"
  default = "17.04"
}

variable "os_image_version" {
  description = "version of OS offer"
  default = "latest"
}

variable "os_disk_type" {
  description = "Which type of managed disk to use. Standard_LRS = HDD, Premium_LRS = SSD"
  default = "Standard_LRS"
}
