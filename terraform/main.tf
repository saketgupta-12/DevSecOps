provider "aws" {
  region = "ap-south-1" # change to your AWS region
}

resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "my-artifacts-bucket-${random_id.id.hex}"
  force_destroy = true
}

resource "random_id" "id" {
  byte_length = 4
}

output "bucket_name" {
  value = aws_s3_bucket.artifact_bucket.bucket
}
