resource "aws_instance" "my-ec2"  {
ami = var.ec2_config[0]
instance_type = var.ec2_config[1]
associate_public_ip_address =  var.ec2_config[2]
tags = {
Name = "my-ec2"
Component = "frontend"
Server = true
}
}