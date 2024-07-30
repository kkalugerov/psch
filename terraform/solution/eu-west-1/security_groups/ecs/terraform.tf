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

module "ecs_sg" {
  source      = "../../../../modules/security_groups/v1.0"
  description = "ECS Security Group"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  usage       = "ecs"
  ingress_rules = {
    "rule0" = {
      from_port                    = 8080
      to_port                      = 8080
      ip_protocol                  = "tcp"
      referenced_security_group_id = data.terraform_remote_state.alb_sg.outputs.alb_sg_id
      description                  = "Allow access from ALB"
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

output "ecs_sg_id" {
  value = module.ecs_sg.security_group_id
}
