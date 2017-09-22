#resource "azurerm_virtual_network" "vnet" {
#  name           = "${var.name}_network"
#  location       = "${var.region}"
#  resource_group_name = "${azurerm_resource_group.instance_rg.name}"
#  dns_servers     = ["8.8.8.8", "8.8.4.4"]
#  address_space   = ["10.0.0.0/16"]
#}
#
#resource azurerm_subnet "subnet" { 
#  name            = "${var.name}_subnetwork"
#  resource_group_name = "${azurerm_resource_group.instance_rg.name}"
#  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
#  address_prefix  = "10.0.0.0/24"
#  network_security_group_id = "${azurerm_network_security_group.cloud-server.id}"
#}

resource "azurerm_network_interface" "interface" {
  name     = "${var.name}_int"
  location = "${var.region}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name     = "${var.name}_instance_ipconf"
    subnet_id = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.pubip.id}"
  }
}

resource "azurerm_public_ip" "pubip" {
  name                         = "${var.name}_pubip"
  location                     = "${var.region}"
  resource_group_name          = "${var.resource_group}"
  public_ip_address_allocation = "static"
}
