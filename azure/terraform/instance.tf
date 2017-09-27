resource "azurerm_virtual_machine" "instance" {
  name = "${var.name}_master"
  location = "${var.region}"
  resource_group_name = "${var.resource_group}"
  vm_size           = "${var.machine_type}"
  network_interface_ids = ["${azurerm_network_interface.interface.id}"]

  os_profile {
    computer_name = "${var.name}"
    admin_username = "${var.username}"
    admin_password = "%KJlqDRO3wJGVQNvKmZ4YlFddRjkkmRm&"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = [{
      path = "/home/${var.username}/.ssh/authorized_keys"
      key_data = "${var.profile_public_key}"
    }]
  }

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "${var.os_image_publisher}"
    offer = "${var.os_image_offer}"
    sku = "${var.os_image_sku}"
    version = "${var.os_image_version}"
  }
  
  storage_os_disk {
    name          = "${var.name}_os_disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    vhd_uri = "${azurerm_storage_account.instance_storage.primary_blob_endpoint}${azurerm_storage_container.instance_container.name}/${var.name}-osdisk.vhd"
  }
}
