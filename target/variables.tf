variable "from_port" {
    default = 22
}

variable "to_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}
variable "fm_port" {
    default = 80
}

variable "tt_port" {
    default = 80
}

variable "cidr" {
    default = ["0.0.0.0/0"]
    }

variable "Instance" {
    default = "t3.micro"
    }