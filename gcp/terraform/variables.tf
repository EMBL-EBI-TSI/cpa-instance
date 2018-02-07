#### Credential ####
# Path to the credential file
#variable "credentials" {
#  default = "credentials.json"
#}

#### Google Project ####
# The Google region where the cluster should be created
variable "region" {
  default = "europe-west1"
}

# Google zone where the cluster should be created
variable "zone" {
  default = "europe-west1-d"
}

variable "project" {
  description = "The ID of the Google Cloud project"
  default = ""
}

variable "disk_image_name" {
  description = "OS image name to use for installation"
  default = ""
}

variable "disk_size" {
  description = "Disk size"
  default = ""
}

# Disk type to use for installation
variable "disk_type" {
  default = "pd-standard"
}

# Benchmark machine type (flavor)
variable "machine_type" {
  default = "f1-micro"
}

#### Networking ####
# The address of the subnet in CIDR
variable "network" {
  default = "10.20.30.0/24"
}

variable "subnet" {
  default = "basic-subnet"
}

variable "net" {
  default = "basic-net"
}

#### Project ####
# The name of the cluster
variable "name" {
  default = "gcloud"
}

# Number of instances to install
variable "instances" {
  default = "1"
}
