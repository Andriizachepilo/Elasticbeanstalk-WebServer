resource "aws_s3_bucket" "EB_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
}


resource "aws_s3_object" "public_object" {
  bucket = aws_s3_bucket.EB_bucket.id
  key    = var.s3_key
  source = var.path_to_upload

}

