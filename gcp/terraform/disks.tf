resource "google_compute_disk" "disk" {
  count = "${var.instances}"
  name  = "disk-${count.index + 1}"
  type  = "pd-ssd"
  zone  = "${var.zone}"
  size  = "${var.disk_size}"
}
