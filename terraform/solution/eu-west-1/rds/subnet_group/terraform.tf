module "subnet_group" {
  source = "../../../../modules/rds/subnet_group/v1.0"

  name        = "test"
  description = "DB Subnet Group used by main database"
  subnet_ids = [
    data.terraform_remote_state.network.outputs.db_subnet_zone_1a_id,
    data.terraform_remote_state.network.outputs.db_subnet_zone_1b_id
  ]
  ### ETC parameters
}

output "db_subnet_group_arn" {
  value = module.subnet_group.db_subnet_group_arn
}

output "db_subnet_group_id" {
  value = module.subnet_group.db_subnet_group_id
}
