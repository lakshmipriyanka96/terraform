data "aws_ami" "tuplei" {
    most_recent = "true"
    owners = ["964476970979"]
filter {
    name = "name"
    values = ["tupleimage"]
}
filter {
    name = "root-device-type"
    values = ["ebs"]
}
filter {
    name = "virtualization-type"
    values = ["hvm"]
}
}
