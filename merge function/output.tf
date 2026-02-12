output "sgid" {
    value = aws_security_group.sg2.id
}

output "instanceid" {
    value = aws_instance.devopstr.id
}

output "publicdns" {
    value = aws_instance.devopstr.public_dns
}

output "privatedns" {
    value = aws_instance.devopstr.private_dns
}

output "amid" {
    value = data.aws_ami.tuplei.id
}

output "public" {
    value = aws_instance.devopstr.public_ip
}

output "private" {
    value = aws_instance.devopstr.public_ip
}