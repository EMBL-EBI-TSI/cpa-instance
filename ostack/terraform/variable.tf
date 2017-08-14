variable "name" {
  default     = "cloud-portal"
  description = "The name of the deployment"
}

variable "availability_zone" {
  default     = "AZ_1"
  description = "The availability zone in which to create the server. Changing this creates a new server."
}

variable "instances" {
  default     = 1
  description = "Number of instances to deploy"
}

variable "disk_image" {
  default     = "ubuntu-16.04"
  description = "OS image name to use for node installation"
}

variable "machine_type" {
  default     = "s1.nano"
  description = "Machine type (flavor)"
}

variable "net" {
  description = "The name of the OpenStack network where to deploy the instance"
}

variable "keypair" {
  default     = "dev-key"
  description = "The OpenStack name of public SSH key to inject in the VM "
}
