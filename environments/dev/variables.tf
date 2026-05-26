variable "project_name" {
  description = "Name used when labeling CDC infrastructure resources."
  type        = string
  default     = "cdc-advanced"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region where the dev infrastructure will be created."
  type        = string
  default     = "ap-northeast-2"
}

variable "vpc_cidr" {
  description = "Private IP address range allocated to the dev VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Private IP address range allocated to the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_size" {
  description = "Friendly size name used to select the EC2 instance type."
  type        = string
  default     = "small"

  validation {
    condition     = contains(["nano", "small", "medium"], var.instance_size)
    error_message = "instance_size must be one of: nano, small, medium."
  }
}

variable "allowed_ingress_cidr" {
  description = "Single trusted public IP CIDR allowed to reach EC2 service ports."
  type        = string
}

variable "allowed_ingress_ports" {
  description = "TCP ports allowed from the trusted public IP CIDR."
  type        = set(number)
}
