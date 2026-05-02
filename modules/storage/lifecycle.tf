resource "aws_s3_bucket_lifecycle_configuration" "images_lifecycle" {
  bucket = aws_s3_bucket.images.id

  rule {
    id     = "Uploads lifecycle rule"
    status = "Enabled"
    filter {
      prefix = "uploads/"
    }
    expiration {
      days = 30
    }
  }

  rule {
    id     = "Processed images rule"
    status = "Enabled"
    filter {
      prefix = "processed/"
    }
    expiration {
      days = 90
    }
  }
}
