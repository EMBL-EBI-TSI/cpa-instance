resource "aws_instance" "instance" {
  ami           = "${var.disk_image_name}"
  instance_type = "${var.machine_type}"
  count         = "${var.instances}"
  key_name      = "${aws_key_pair.aws.key_name}"
  subnet_id     = "${var.subnet_id}"

  vpc_security_group_ids = [
    "${aws_security_group.allow-egress.id}",
    "${aws_security_group.allow-http.id}",
    "${aws_security_group.allow-https.id}",
    "${aws_security_group.allow-icmp.id}",
    "${aws_security_group.allow-ssh.id}",
  ]

  instance_initiated_shutdown_behavior = "terminate"

  root_block_device = {
    delete_on_termination = true
    volume_type           = "${var.volume_type}"

    #    volume_size           = "${var.volume_size}"
  }

  tags = {
    Name = "${var.name}-${count.index + 1}"
  }
}
