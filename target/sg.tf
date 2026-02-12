resource "aws_security_group" "tsg2" {
    description = "creating sg"
    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks = var.cidr
    }

    ingress {
        from_port = var.fm_port
        to_port = var.tt_port
        protocol = var.protocol
        cidr_blocks = var.cidr
    }

    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = var.cidr
    }
    tags = {
        Name = "My-target-Sg"
        Target_Sg = "true"
        Project = "roboshop"
        Environment = "dev"
    }
}