resource "azurerm_network_security_group" "cloud-server" {
  name = "${var.name}-cloud-server"
  location = "${var.region}"
  resource_group_name = "${var.resource_group}"

  security_rule {
    name = "ssh"
    priority = "100"
    protocol = "Tcp"
    direction = "Inbound"
    source_port_range = "*"
    destination_port_range = 22
    source_address_prefix = "0.0.0.0/0"
    destination_address_prefix = "0.0.0.0/0"
    access = "Allow"
  }

  security_rule {
    name = "http"
    priority = "101"
    protocol = "Tcp"
    direction = "Inbound"
    source_port_range = "*"
    destination_port_range = 80
    source_address_prefix = "0.0.0.0/0"
    destination_address_prefix = "0.0.0.0/0"
    access = "Allow"
  }

  security_rule {
    name = "https"
    priority = "102"
    protocol = "Tcp"
    direction = "Inbound"
    source_port_range = "*"
    destination_port_range = 443
    source_address_prefix = "0.0.0.0/0"
    destination_address_prefix = "0.0.0.0/0"
    access = "Allow"
  }
}
