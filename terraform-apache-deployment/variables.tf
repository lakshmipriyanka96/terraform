variable "insttype" {
default = "t3.micro"
type = string
}


variable "cidr" {
default = ["0.0.0.0/0"]
type = list
}

variable "from_port" {
default = 80
type = number
}

variable "to_port" {
default = 80
type = number
}
