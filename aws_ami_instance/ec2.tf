resource "aws_instance" "myec2"{
    ami = local.ami
    instance_type = local.instance_type
    user_data = file("script.sh")
    tags = {
     Project = "roboshop"
     Roboshop = true
     Created by = "terraform"
    }
   }
resource "aws_ami_from_instance" "myami1"