output "external_ip" {
    value = "${google_compute_instance.instance.ip_address}"
}
