resource "aws_s3_bucket" "remote-state-dev" {
bucket = var.bucket_name
tags = merge(
    var.common_tags,
    {
      Name = "My-bucket"
      bucket = true  
    }
)
}