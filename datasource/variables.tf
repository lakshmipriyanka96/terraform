variable "ami_id" {
    type = string
 default = "ami-09c813fb71547fc4f" # Example AMI ID
}
variable "instance_type" {
    type = string
 default = "t3.micro"

}
variable "ec2_tags"{
    type = map
    default = {
    Name = "terraform-demo"
    Terraform = "true"
    Project = "joindevops"
    Environment = "dev"
}
}
variable "sg_name"{
    type = string
    default = "allow_all"
    description = "security Group Name to attach to EC2 instance"

}
 variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
   } 
variable "ingress_from_port" {
    default = 0
}
variable "ingress_to_port"{
    default = 0
}
variable "egress_from_port" {
    default = 0
}
variable "egress_to_port"{
    default = 0
}
variable "protocol"{
    type = string
    default = "-1"
}