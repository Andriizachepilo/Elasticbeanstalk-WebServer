output "aws_s3_bucket_id" {
  value = aws_s3_bucket.EB_bucket.id
}

output "aws_s3_public_object" {
  value = aws_s3_object.public_object.id
}

