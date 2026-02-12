locals {
    instance_type = "t3.micro"
    ami = data.aws_ami.myami.id
}