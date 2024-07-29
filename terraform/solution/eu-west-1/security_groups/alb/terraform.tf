module "alb_sg" {
  source      = "../../../../modules/security_groups/v1.0"
  description = "Public ALB Security Group"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  usage       = "public-alb"
  ingress_rules = {
    "rule0" = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "213.91.248.149/32"
      description = "Allow HTTP access from home network"
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

output "alb_sg_id" {
  value = module.alb_sg.security_group_id
}
