output "ec2id" {
    value = aws_instance.tec2[*].id
}