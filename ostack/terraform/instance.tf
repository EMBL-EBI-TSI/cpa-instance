resource "openstack_compute_instance_v2" "instance" {
  count             = "${var.instances}"
  flavor_name       = "${var.machine_type}"
  key_pair          = "${var.keypair}"
  image_name        = "${var.disk_image}"
  availability_zone = "${var.availability_zone}"
  name              = "${var.name}-${count.index + 1}"

  network {
    name           = "${var.net}"
    access_network = true
  }

  security_groups = [
    "${openstack_compute_secgroup_v2.cloud-server.name}",
  ]
}
