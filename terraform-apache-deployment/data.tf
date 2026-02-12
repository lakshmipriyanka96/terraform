data "aws_ami" "tfimage" {
most_recent = true
owners = ["964476970979"]


filter {
 name = "name"
 values = ["terra"]
 
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