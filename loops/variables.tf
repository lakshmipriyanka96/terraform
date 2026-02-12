variable "instances" {
    default = ["mongodb", "redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
}

variable "zone_id" {
    default = "Z05166562P910VXJWOR8Y"
}

variable "domain_name" {
    default = "karela.fun"
}