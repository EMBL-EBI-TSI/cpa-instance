resource "google_compute_instance" "instance" {
  count         = "${var.instances}"
  name          = "${var.name}-instance-${count.index + 1}"
  machine_type  = "${var.machine_type}"
  zone          = "${var.zone}"
  tags          = ["http", "https", "ssh", "vpn"]

  disk {
    image       = "${var.disk_image_name}"
    type        = "${var.disk_type}"
    size        = "${var.disk_size}"
  }

#  disk {
#    disk        = "disk-${count.index + 1}"
#  }

  metadata {
    count       = "${var.instances}"
    clustername = "${var.name}"
    myid        = "${count.index}"
    network     = "${var.network}"
  }

  # network interface
  network_interface {
    subnetwork    = "${var.subnet}"
    access_config {
      // Ephemeral IP
    }
  }

  depends_on   = ["google_compute_disk.disk"]
  # metadata_startup_script = "${file("config.sh")}"
}
