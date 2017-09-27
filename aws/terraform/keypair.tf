resource "aws_key_pair" "aws" {
  key_name   = "${var.name}-ssh_public_key"
  public_key = "${var.profile_public_key}"
}
