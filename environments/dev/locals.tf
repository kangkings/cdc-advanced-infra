locals {
  instance_types = {
    nano   = "t3a.nano"
    small  = "t3a.small"
    medium = "t3a.medium"
  }

  selected_instance_type = local.instance_types[var.instance_size]

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
