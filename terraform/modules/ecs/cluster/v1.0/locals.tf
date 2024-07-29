################################################################################
# Cluster
################################################################################

locals {
  execute_command_configuration = {
    logging = "OVERRIDE"
    log_configuration = {
      cloud_watch_log_group_name = try(aws_cloudwatch_log_group.this[0].name, null)
    }
  }
}

################################################################################
# Cluster Capacity Providers
################################################################################

locals {
  default_capacity_providers = merge(
    { for k, v in var.fargate_capacity_providers : k => v if var.default_capacity_provider_use_fargate },
    { for k, v in var.autoscaling_capacity_providers : k => v if !var.default_capacity_provider_use_fargate }
  )
}

