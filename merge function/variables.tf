variable "common_tags" {
type = map
default = {
Project = "roboshop"
Terraform = "True"
}
}
variable "from_port" {
    type = number
    default = 22
}
variable "to_port" {
    type = number
    default = 22
}
variable "portf" {
    type = number
    default = 80
}
variable "portt" {
    type = number
    default = 80
}
variable "protocol_type" {
    type = string
    default = "tcp"
}
variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}
