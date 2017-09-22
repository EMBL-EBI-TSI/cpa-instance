data "aws_subnet" "selected" {
  id = "${var.subnet_id}"
}
