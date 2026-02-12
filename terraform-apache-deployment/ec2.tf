resource "aws_instance" "cec2" {
 ami = data.aws_ami.tfimage.id
 
 instance_type = var.insttype
 user_data = file("apache.sh")

tags = {
Name = "ec2"
Instance = "True"
}
}