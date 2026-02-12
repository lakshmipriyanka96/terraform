terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }
backend "s3"{
    bucket = "priyas386"
    key    = "remote1-state-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
}
}