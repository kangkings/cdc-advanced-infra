locals {
  instance_types = {
    nano   = "t3a.nano"
    small  = "t3a.small"
    medium = "t3a.medium"
  }

  selected_instance_types = {
    for role, config in var.ec2_instances :
    role => local.instance_types[config.instance_size]
  }

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
