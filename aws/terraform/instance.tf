resource "aws_instance" "instance" {
  ami           = "${var.disk_image}"
  instance_type = "${var.machine_type}"
  count         = "${var.instances}"
  key_name      = "${aws_key_pair.aws.key_name}"


  instance_initiated_shutdown_behavior = "terminate"
  root_block_device = {
    delete_on_termination = true
    volume_type           = "${var.volume_type}"
  }
  tags = {
    Name = "${var.name}-${count.index + 1}"
  }
}
