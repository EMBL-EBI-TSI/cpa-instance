variable "name" {
  default     = "cloud-portal"
  description = "The name of the deployment"
}

variable "instances" {
  default     = 1
  description = "Number of instances to deploy"
}

variable "disk_image_name" {
  default     = "ami-bb9a6bc2"
  description = "OS AMI image name to use for node installation"
}

variable "machine_type" {
  default     = "t2.micro"
  description = "Machine type (flavor)"
}

variable "volume_type" {
  default = "standard"
}

variable "region" {
  type    = "string"
  default = "eu-west-1"
}

variable "profile_public_key" {
  description = "The ssh public key to inject in the host"
}

### Network

variable "subnet_id" {
  description = "The ID of the subnet where the virtual machine will be deployed"
}
