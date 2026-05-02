output "vpc_id" {
  description = "Main VPC ID"
  value       = aws_vpc.main.id
}

output "private_subnet_az_a_id" {
  description = "Main private subnet ID in AZ-a"
  value       = aws_subnet.private-AZ-a.id
}

output "private_subnet_az_b_id" {
  description = "Main private subnet ID in AZ-b"
  value       = aws_subnet.private-AZ-b.id
}
