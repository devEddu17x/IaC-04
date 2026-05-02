module "networking" {
  source                        = "../../modules/networking"
  aws_region                    = var.aws_region
  aws_availability_zone_main    = var.aws_availability_zone_main
  aws_availability_zone_replica = var.aws_availability_zone_replica
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.networking.vpc_id
  env    = "dev"
}
