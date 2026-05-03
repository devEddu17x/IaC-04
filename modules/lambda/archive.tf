data "archive_file" "sign_lambda_zip" {
  type        = "zip"
  source_dir  = "../../services/lambdas/sign-lambda"
  output_path = "${path.module}/sign-lambda.zip"
}

data "archive_file" "crop_lambda_zip" {
  type        = "zip"
  source_dir  = "../../services/lambdas/crop-lambda"
  output_path = "${path.module}/crop-lambda.zip"
}
