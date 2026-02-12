data "aws_ami" "tami" {
  owners = ["964476970979"]
  most_recent = true

  filter {
    name = "name"
    values = ["tupleimage"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}