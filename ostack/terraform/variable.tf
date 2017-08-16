variable "name" {
  default     = "cloud-portal"
  description = "The name of the deployment"
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

variable "network_name" {
  description = "The name of the OpenStack network where to deploy the instance"
}

variable "profile_public_key" {
  description = "The public SSH key to be injected in the vm"
  type        = "string"
}

variable "floatingip_pool" {
  default = "net_external"
}
