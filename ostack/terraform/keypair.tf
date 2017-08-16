resource "openstack_compute_keypair_v2" "keypair" {
  name       = "${var.name}-keypair"
  public_key = "${var.profile_public_key}"
}
