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

module "db_sg" {
  source      = "../../../../modules/security_groups/v1.0"
  description = "DB Security Group"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  usage       = "db"
  ingress_rules = {
    "rule0" = {
      from_port                    = 5432
      to_port                      = 5432
      ip_protocol                  = "tcp"
      referenced_security_group_id = data.terraform_remote_state.ecs_sg.outputs.ecs_sg_id
      description                  = "Allow access from ECS SG"
    }
  }
  egress_rules = {
    "rule0" = {
      from_port   = -1
      to_port     = -1
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all egress"
    }
  }
}

output "db_sg_id" {
  value = module.db_sg.security_group_id
}
