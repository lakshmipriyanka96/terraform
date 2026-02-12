data "aws_ami" "myami" {
    most_recent = true
    owners = ["964476970979"]
    filter = {
        Name = "name"
        values = ["myami1"]
    }
    filter = {
        Name = "root-volume-type"
        values = ["ebs"]
    }
    filter = {
        Name = "virtualization"
        values = ["hvm"]
    }
}