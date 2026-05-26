output "selected_instance_type" {
  description = "EC2 instance type resolved from the selected friendly size."
  value       = local.selected_instance_type
}

output "vpc_id" {
  description = "ID of the VPC created for the dev environment."
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "Private IP address range assigned to the dev VPC."
  value       = aws_vpc.main.cidr_block
}

output "internet_gateway_id" {
  description = "ID of the internet gateway attached to the dev VPC."
  value       = aws_internet_gateway.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet created for the dev environment."
  value       = aws_subnet.public.id
}

output "ec2_security_group_id" {
  description = "ID of the security group intended for CDC EC2 instances."
  value       = aws_security_group.ec2.id
}
