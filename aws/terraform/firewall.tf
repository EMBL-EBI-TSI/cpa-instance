# AWS Security Groups
# Equivalent to firewall rules for other cloud provider

resource "aws_security_group" "allow-http" {
  name        = "${var.name}-allow-http"
  description = "Allow HTTP traffic on port 80"

  vpc_id = "${data.aws_subnet.selected.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-https" {
  name        = "${var.name}-allow-https"
  description = "Allow HTTPS"
  vpc_id      = "${data.aws_subnet.selected.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-icmp" {
  name        = "${var.name}-allow-icmp"
  description = "Allow icmp"
  vpc_id      = "${data.aws_subnet.selected.vpc_id}"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    self        = true
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    self        = true
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-ssh" {
  name        = "${var.name}-allow-ssh"
  description = "Allow ssh"
  vpc_id      = "${data.aws_subnet.selected.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-egress" {
  name        = "${var.name}-allow-egress"
  description = "Allow egress"
  vpc_id      = "${data.aws_subnet.selected.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
