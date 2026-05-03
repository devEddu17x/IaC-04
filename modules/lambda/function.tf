resource "aws_lambda_function" "sign_lambda" {
  filename      = data.archive_file.sign_lambda_zip.output_path
  function_name = "sign-lambda-${var.env}"
  handler       = "index.handler"
  role          = var.sign_lambda_role_arn
  runtime       = "nodejs20.x"
  environment {
    variables = {
      S3_BUCKET      = var.s3_bucket_name
      UPLOADS_PREFIX = var.s3_images_upload_prefix
    }
  }

  source_code_hash = data.archive_file.sign_lambda_zip.output_base64sha256
  vpc_config {
    subnet_ids         = [var.private_subnet_az_a_id, var.private_subnet_az_b_id]
    security_group_ids = [var.sg_sign_lambda_id]
  }

  depends_on = [aws_cloudwatch_log_group.sign_lambda_logs]
}

resource "aws_lambda_function" "crop_lambda" {
  filename      = data.archive_file.crop_lambda_zip.output_path
  function_name = "crop-lambda-${var.env}"
  handler       = "index.handler"
  role          = var.crop_lambda_role_arn
  timeout       = 60
  runtime       = "nodejs20.x"
  memory_size   = 512
  environment {
    variables = {
      S3_BUCKET        = var.s3_bucket_name
      PROCESSED_PREFIX = var.s3_images_processed_prefix
    }
  }

  source_code_hash = data.archive_file.crop_lambda_zip.output_base64sha256
  vpc_config {
    subnet_ids         = [var.private_subnet_az_a_id, var.private_subnet_az_b_id]
    security_group_ids = [var.sg_crop_lambda_id]
  }

  depends_on = [aws_cloudwatch_log_group.crop_lambda_logs]
}
