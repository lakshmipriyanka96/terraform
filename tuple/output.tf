output "first-value"  {
value = var.ec2_config[0]
}
output "Second-value"  {
value = var.ec2_config[1]
}
output "third-value"  {
value = var.ec2_config[2]
}
output "public-ip" {
    value = aws_instance.my-ec2.public_ip
}

output "private-ip" {
    value = aws_instance.my-ec2.private_ip
}

output "private-dns" {
    value = aws_instance.my-ec2.private_dns
}