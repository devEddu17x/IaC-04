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
  env        = "dev"
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
  env                = "dev"
  sqs_main_queue_arn = module.sqs.sqs_main_queue_arn
}

module "sqs" {
  source               = "../../modules/sqs"
  env                  = "dev"
  name_prefix          = var.name_prefix
  s3_bucket_images_arn = module.storage.s3_bucket_images_arn
}

module "iam" {
  source               = "../../modules/iam"
  s3_bucket_images_arn = module.storage.s3_bucket_images_arn
  sqs_main_queue_arn   = module.sqs.sqs_main_queue_arn
}
