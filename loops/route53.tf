resource "aws_route53_record" "roboshop" {
 count = length(var.instances)
 zone_id = "${var.zone_id}"
 name = "${var.instances[count.index]}.${var.domain_name}" # Replace with your domain name
 type = "A"
 ttl = 1
 records = [aws_instance.terraform[count.index].private_ip]
 allow_overwrite = true # Replace with your desired IP address
}