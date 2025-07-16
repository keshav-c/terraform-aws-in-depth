resource "aws_instance" "hello_world" {
  ami           = data.aws_ami.ubuntu.id
  subnet_id     = var.subnet_id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = merge(var.tags, {
    Name = "${var.name_prefix}-${count.index}"
  })
}
