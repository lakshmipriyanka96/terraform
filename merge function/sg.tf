resource "aws_security_group" "sg2" {
    description = "creating sg for merge function"
    
    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol_type
        cidr_blocks = var.cidr
        description = "allowing data for port"
    }
    ingress {
        from_port = var.portf
        to_port = var.portt
        protocol = "tcp"
        cidr_blocks = var.cidr
        description = "allowing data for port"
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr
        description = "allowing data for port"
    }
    tags = {
        Name = "my-merge-sg"
        Project = "Roboshop"
        Sg = "true"
        Env = "dev"
    }
}