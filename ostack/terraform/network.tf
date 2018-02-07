resource "openstack_networking_floatingip_v2" "floatingip" {
  pool = "${var.floating_ip_pool}"
}
