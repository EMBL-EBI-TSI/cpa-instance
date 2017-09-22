output "external_ip" {
  value = "${azurerm_public_ip.pubip.ip_address}"
}
