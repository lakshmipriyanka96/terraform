data "aws_ami" "tamil" {
  owners = ["964476970979"]
  most_recent = true

  filter {
    name = "name"
    values = ["asd"]
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