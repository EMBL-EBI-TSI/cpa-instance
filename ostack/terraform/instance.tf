data "openstack_images_image_v2" "instance_image" {
  name        = "${var.disk_image_name}"
  most_recent = true
}

resource "openstack_compute_instance_v2" "instance" {
  count       = "${var.instances}"
  flavor_name = "${var.machine_type}"
  key_pair    = "${var.name}-keypair"
  name        = "${var.name}-${count.index + 1}"

  block_device {
    uuid                  = "${data.openstack_images_image_v2.instance_image.id}"
    source_type           = "image"
    volume_size           = "${var.instance_volume_size}"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name           = "${var.network_name}"
    access_network = true
  }

  security_groups = [
    "${openstack_compute_secgroup_v2.cloud-server.name}",
  ]
}

resource "openstack_compute_floatingip_associate_v2" "floatingip_associate" {
  floating_ip = "${openstack_networking_floatingip_v2.floatingip.address}"
  /* TODO : Not 100% sure hardcoded "[0]" is solution to "Error: Missing resource instance key" issue!
            https://stackoverflow.com/questions/63147590/terraform-missing-resource-instance-key */
  instance_id = "${openstack_compute_instance_v2.instance[0].id}"
}
