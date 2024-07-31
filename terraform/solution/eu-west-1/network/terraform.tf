provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      "Deployment" = "Terraform"
      "Owner"      = "Kristiyan Kalugerov"
      "DeleteMe"   = "No"
    }
  }
}

module "network" {
  source = "../../../modules/network/v1.0"

  vpc_cidr        = "10.0.0.0/16"
  public_1a_cidr  = "10.0.0.0/20"
  public_1b_cidr  = "10.0.16.0/20"
  private_1a_cidr = "10.0.32.0/20"
  private_1b_cidr = "10.0.48.0/20"
  db_1a_cidr      = "10.0.64.0/20"
  db_1b_cidr      = "10.0.80.0/20"
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
