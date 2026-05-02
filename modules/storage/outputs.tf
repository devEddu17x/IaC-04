output "s3_bucket_images_arn" {
  description = "ARN of the S3 bucket for images"
  value       = aws_s3_bucket.images.arn
}

output "s3_bucket_name" {
  description = "Name of images bucket"
  value       = aws_s3_bucket.images.bucket
}

output "s3_bucket_id" {
  description = "ID of images bucket"
  value       = aws_s3_bucket.images.id
}
