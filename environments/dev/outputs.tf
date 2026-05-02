output "networking_vpc_id" {
  description = "VPC id"
  value       = module.networking.vpc_id
}

output "private_subnet_az_a_id" {
  description = "Main private subnet ID in AZ-a"
  value       = module.networking.private_subnet_az_a_id
}

output "private_subnet_az_b_id" {
  description = "Main private subnet ID in AZ-b"
  value       = module.networking.private_subnet_az_b_id
}
