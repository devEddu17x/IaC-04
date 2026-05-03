module "networking" {
  source                        = "../../modules/networking"
  aws_region                    = var.aws_region
  aws_availability_zone_main    = var.aws_availability_zone_main
  aws_availability_zone_replica = var.aws_availability_zone_replica
}

module "security" {
  source     = "../../modules/security"
  vpc_id     = module.networking.vpc_id
  aws_region = var.aws_region
  env        = var.env
}

module "endpoints" {
  source                     = "../../modules/endpoints"
  aws_region                 = var.aws_region
  vpc_id                     = module.networking.vpc_id
  route_table_private_a_id   = module.networking.route_table_private_a_id
  route_table_private_b_id   = module.networking.route_table_private_b_id
  private_subnet_az_a_id     = module.networking.private_subnet_az_a_id
  private_subnet_az_b_id     = module.networking.private_subnet_az_b_id
  security_group_vpce_sqs_id = module.security.sg_sqs_vpce_id
}

module "storage" {
  source             = "../../modules/storage"
  env                = var.env
  sqs_main_queue_arn = module.sqs.sqs_main_queue_arn
}

module "sqs" {
  source               = "../../modules/sqs"
  env                  = var.env
  name_prefix          = var.name_prefix
  s3_bucket_images_arn = module.storage.s3_bucket_images_arn
}

module "iam" {
  source               = "../../modules/iam"
  s3_bucket_images_arn = module.storage.s3_bucket_images_arn
  sqs_main_queue_arn   = module.sqs.sqs_main_queue_arn
}

module "lambda" {
  source                     = "../../modules/lambda"
  env                        = var.env
  s3_bucket_name             = module.storage.s3_bucket_name
  s3_images_upload_prefix    = "uploads"
  s3_images_processed_prefix = "processed"
  sign_lambda_role_arn       = module.iam.sign_lambda_role_arn
  crop_lambda_role_arn       = module.iam.crop_lambda_role_arn
  private_subnet_az_a_id     = module.networking.private_subnet_az_a_id
  private_subnet_az_b_id     = module.networking.private_subnet_az_b_id
  sg_sign_lambda_id          = module.security.sg_sign_lambda_id
  sg_crop_lambda_id          = module.security.sg_crop_lambda_id
  sg_sqs_vpce_id             = module.security.sg_sqs_vpce_id
  sqs_queue_arn              = module.sqs.sqs_main_queue_arn
}

module "apigateway" {
  source                 = "../../modules/apigateway"
  env                    = var.env
  sign_lambda_invoke_arn = module.lambda.sign_lambda_invoke_arn
  sign_lambda_name       = module.lambda.sign_lambda_name
}
