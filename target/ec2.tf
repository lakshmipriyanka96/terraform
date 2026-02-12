resource "aws_instance" "tec2" {
    ami = data.aws_ami.tami.id
    count = 10
    instance_type = var.Instance
    vpc_security_group_ids = [aws_security_group.tsg2.id]
    tags = {
        name = "ec2-${count.index} "
        Tec2 = "true"
    }
}

#terraform destroy -auto-approve  -target=aws_instance.tec2[8]  -target=aws_instance.tec2[9]  -target=aws_instance.tec2[3]
