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

output "route_table_private_a_id" {
  description = "Route table for private subnet in AZ-a"
  value       = module.networking.route_table_private_a_id

}

output "route_table_private_b_id" {
  description = "Route table for private subnet in AZ-b"
  value       = module.networking.route_table_private_b_id

}
