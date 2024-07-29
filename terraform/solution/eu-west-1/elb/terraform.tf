module "ecs_alb" {
  source             = "../../../modules/elb/v1.0"
  name               = "ecs-alb"
  load_balancer_type = "application"
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id
  subnets = [
    data.terraform_remote_state.network.outputs.public_subnet_zone_1a_id,
    data.terraform_remote_state.network.outputs.public_subnet_zone_1b_id,
  ]
  security_groups = [
    data.terraform_remote_state.security_groups.outputs.alb_sg_id
  ]
}

output "ecs_lb_id" {
  value = module.ecs_alb.lb_id
}

output "ecs_lb_name" {
  value = module.ecs_alb.lb_name
}

output "ecs_lb_arn" {
  value = module.ecs_alb.lb_arn
}

output "lb_dns_name" {
  value = module.ecs_alb.lb_dns_name
}

output "lb_dns_zone_id" {
  value = module.ecs_alb.lb_zone_id
}
