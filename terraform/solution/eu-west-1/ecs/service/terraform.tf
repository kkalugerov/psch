module "service" {
  source = "../../../../modules/ecs/service/v1.0"

  vpc_id                = data.terraform_remote_state.network.outputs.vpc_id
  load_balancer_arn     = data.terraform_remote_state.elb.outputs.ecs_lb_arn
  listener_port         = 80
  listener_protocol     = "HTTP"
  target_group_port     = 8080
  target_group_protocol = "HTTP"

  service_name                    = "python-web-app"
  account_id                      = data.aws_caller_identity.current.account_id
  image_name                      = "kalugeroff-python-web-app"
  cluster_id                      = data.terraform_remote_state.cluster.outputs.cluster_id
  ecs_task_desired_count          = 2
  container_port                  = 8080
  cd_port_mappings_container_port = 8080
  service_security_group_ids = [
    data.terraform_remote_state.security_groups.outputs.ecs_sg_id
  ]
  service_subnet_ids = [
    data.terraform_remote_state.network.outputs.private_subnet_zone_1a_id,
    data.terraform_remote_state.network.outputs.private_subnet_zone_1a_id
  ]
  td_execution_role_arn = data.terraform_remote_state.iam.outputs.ecs_task_execution_role_arn
}
