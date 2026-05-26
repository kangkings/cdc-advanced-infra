output "selected_instance_types" {
  description = "EC2 instance types resolved for each CDC role."
  value       = local.selected_instance_types
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

output "public_subnet_availability_zone" {
  description = "Availability zone used by the public subnet and attached EC2 instance."
  value       = aws_subnet.public.availability_zone
}

output "ec2_security_group_id" {
  description = "ID of the security group intended for CDC EC2 instances."
  value       = aws_security_group.ec2.id
}

output "ubuntu_ami_id" {
  description = "Latest Canonical Ubuntu 24.04 LTS amd64 AMI selected for EC2."
  value       = data.aws_ami.ubuntu.id
}

output "ec2_instance_ids" {
  description = "IDs of the CDC EC2 instances by role."
  value = {
    for role, instance in aws_instance.cdc :
    role => instance.id
  }
}

output "ec2_public_ips" {
  description = "Public IPv4 addresses of the CDC EC2 instances by role."
  value = {
    for role, instance in aws_instance.cdc :
    role => instance.public_ip
  }
}
