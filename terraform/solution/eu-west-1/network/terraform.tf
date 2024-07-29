module "network" {
  source = "../../../modules/network/v1.0"

  vpc_cidr        = "10.0.0.0/16"
  public_1a_cidr  = "10.0.1.0/24"
  public_1b_cidr  = "10.0.2.0/24"
  private_1a_cidr = "10.0.3.0/24"
  private_1b_cidr = "10.0.4.0/24"
  db_1a_cidr      = "10.0.5.0/24"
  db_1b_cidr      = "10.0.6.0/24"
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_zone_1a_id" {
  value = module.network.public_subnet_zone_1a_id
}

output "public_subnet_zone_1b_id" {
  value = module.network.public_subnet_zone_1b_id
}

output "private_subnet_zone_1a_id" {
  value = module.network.private_subnet_zone_1a_id
}

output "private_subnet_zone_1b_id" {
  value = module.network.private_subnet_zone_1b_id
}

output "db_subnet_zone_1a_id" {
  value = module.network.db_subnet_zone_1a_id
}

output "db_subnet_zone_1b_id" {
  value = module.network.db_subnet_zone_1b_id
}
