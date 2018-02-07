resource "openstack_compute_instance_v2" "instance" {
  count       = "${var.instances}"
  flavor_name = "${var.machine_type}"
  key_pair    = "${var.name}-keypair"
  image_name  = "${var.disk_image_name}"
  name        = "${var.name}-${count.index + 1}"

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
  instance_id = "${openstack_compute_instance_v2.instance.id}"
}
