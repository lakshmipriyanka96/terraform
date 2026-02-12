variable "region" {
    default = "us-east-1"
    type = string
    description = "assigining region name"
}
variable "ec2_config" {
type = tuple([string , string , bool])
default = [ "ami-0033413b466b5e1e7" , "t3.small" , false]   # index starts from 0 to n-1
description = "i am setting up to ec2 configuration for server"
}
