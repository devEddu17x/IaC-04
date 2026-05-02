resource "aws_s3_bucket_versioning" "images_versioning" {
  bucket = aws_s3_bucket.images.id

  versioning_configuration {
    status = "Enabled"
  }
}
