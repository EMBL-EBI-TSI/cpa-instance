resource "openstack_compute_secgroup_v2" "cloud-server" {
  name        = "${var.name}-cloud-server"
  description = "Allow HTTP, HTTPS, SSH and icmp traffic"

  rule {
    ip_protocol = "tcp"
    from_port   = 80
    to_port     = 80
    cidr        = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port   = 443
    to_port     = 443
    cidr        = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "icmp"
    from_port   = -1
    to_port     = -1
    cidr        = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port   = 22
    to_port     = 22
    cidr        = "0.0.0.0/0"
  }
}
