# Configure the AWS Provider
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_key_pair" "aws" {
  key_name   = "${var.name}-ssh_public_key"
  public_key = "${var.profile_public_key}"
}
