resource "aws_security_group" "sg"{
name = "SG1"
description = "creating for I/O rules"

ingress {
cidr_blocks = var.cidr
from_port = var.from_port
to_port = var.to_port
protocol = "tcp"
description = "allowing port number 80 for apache"
}

egress {
cidr_blocks = ["0.0.0.0/0"]
from_port = 0
to_port = 0
protocol = -1
description = "all traffic"
}
}
