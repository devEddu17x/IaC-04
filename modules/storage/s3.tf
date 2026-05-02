resource "aws_s3_bucket" "images" {
  bucket = "${var.name_prefix}-image-processor-${var.env}-images-suffix"
}
