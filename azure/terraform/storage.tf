resource "azurerm_storage_account" "instance_storage" {
  name = "${var.name}strg"
  resource_group_name = "${var.resource_group}"
  location = "${var.region}"
  account_type = "${var.os_disk_type}"
}

resource "azurerm_storage_container" "instance_container" {
  name = "${var.name}-vhds"
  resource_group_name = "${var.resource_group}"
  storage_account_name = "${azurerm_storage_account.instance_storage.name}"
  container_access_type = "private"
}
