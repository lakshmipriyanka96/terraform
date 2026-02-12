data "aws_ami" "lakshmi" {
  most_recent      = true
  owners           = ["964476970979"]

  filter {
    name   = "name"
    values = ["devops123"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
output "ami_id" {
    value = data.aws_ami.lakshmi.id
}