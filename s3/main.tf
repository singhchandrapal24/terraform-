provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "my-s3-bucket1" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}
