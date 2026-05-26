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

variable "availability_zone" {
  description = "Availability zone where public dev compute resources are placed."
  type        = string
  default     = "ap-northeast-2a"
}

variable "ec2_instances" {
  description = "CDC EC2 roles and each role's selected instance size."

  type = map(object({
    instance_size = string
  }))

  default = {
    oracle-db = {
      instance_size = "nano"
    }
    redis-and-kafka = {
      instance_size = "nano"
    }
    spring = {
      instance_size = "nano"
    }
    mysql = {
      instance_size = "nano"
    }
  }

  validation {
    condition = alltrue([
      for instance in values(var.ec2_instances) :
      contains(["nano", "small", "medium"], instance.instance_size)
    ])
    error_message = "Each EC2 instance_size must be one of: nano, small, medium."
  }
}

variable "key_pair_name" {
  description = "Existing AWS EC2 key pair name used for SSH access."
  type        = string
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB for the CDC EC2 instance."
  type        = number
  default     = 30

  validation {
    condition     = var.root_volume_size >= 8
    error_message = "root_volume_size must be at least 8 GiB."
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
