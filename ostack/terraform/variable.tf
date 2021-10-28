variable "name" {
  default     = "cloud-portal"
  description = "The name of the deployment"
}

variable "instances" {
  default     = 1
  description = "Number of instances to deploy"
}

variable "public_key_path" {
  description = "The path of the public SSH key to be injected in the vm"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "disk_image_name" {
  default     = "ubuntu-16_04"
  description = "OS image name to use for node installation"
}

variable "machine_type" {
  default     = "1c2m20d"
  description = "Machine type (flavor)"
}

variable "instance_volume_size" {
  default     = "20"
  description = "Instance volume size."
}

variable "network_name" {
  description = "The name of the OpenStack network where to deploy the instance"
}

variable "floating_ip_pool" {
  default = "net_external"
}

variable "user_name" {
  default = "default.user_name"
  description = "Your email (although I don't think the value is used or verified at any point!)"
}

variable "tenant_name" {
  default = "default.tenant_name"
  description = "See https://uk1.embassy.ebi.ac.uk/identity/application_credentials/create/, or OpenStack CLI openstack project list"
}

variable "region" {
  default = "RegionOne"
  description = "See https://uk1.embassy.ebi.ac.uk/identity/application_credentials/create/ or OpenStack CLI openstack region list"
}

variable "auth_url" {
  default = "https://uk1.embassy.ebi.ac.uk:5000"
  description = "See https://uk1.embassy.ebi.ac.uk/project/api_access/ (Identity Service), or https://uk1.embassy.ebi.ac.uk/identity/application_credentials/create/"
}
