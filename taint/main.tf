resource "aws_instance" "taintec2"{
    ami = data.aws_ami.tamil.id
    instance_type = var.instance
    tags = {
        Name = "ec2-creation"
        Ec2 = true
    }

}