resource "aws_instance" "devopstr" {
    ami = data.aws_ami.tuplei.id
    vpc_security_group_ids =[aws_security_group.sg2.id]
    instance_type = "t3.micro"
     tags = merge(
     var.common_tags,
     {
       Name = "ec2-server"
       Env = "Dev"
       Instance = "True"    
     }
   )
}
