resource "aws_alb_target_group" "this" {
  name        = format("%s-%s-%s", var.prefix, var.usage, "tg")
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    enabled             = var.health_check_enabled
    interval            = var.health_check_interval
    path                = var.health_check_path
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_ubhealthy_threshold
    timeout             = var.health_check_timeout
    protocol            = var.health_check_protocol
    matcher             = var.health_check_matcher
  }

  tags = var.tags
}

resource "aws_alb_listener" "this" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.listener_ssl_policy
  certificate_arn   = var.listener_certificate_arn

  default_action {
    target_group_arn = aws_alb_target_group.this.arn
    type             = var.listener_defailt_action
  }
}

resource "aws_ecs_service" "this" {
  name                               = format("%s-%s", var.prefix, var.service_name)
  cluster                            = var.cluster_id
  task_definition                    = aws_ecs_task_definition.this.arn
  desired_count                      = var.ecs_task_desired_count
  deployment_minimum_healthy_percent = var.ecs_task_deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.ecs_task_deployment_maximum_percent
  launch_type                        = var.service_launch_type

  load_balancer {
    target_group_arn = aws_alb_target_group.this.arn
    container_name   = format("%s-%s", var.prefix, var.service_name)
    container_port   = var.container_port
  }

  network_configuration {
    security_groups  = var.service_security_group_ids
    subnets          = var.service_subnet_ids
    assign_public_ip = var.assign_public_ip
  }

  lifecycle {
    ignore_changes = [desired_count]
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = format("%s-%s", var.prefix, var.service_name)
  network_mode             = var.td_network_mode
  requires_compatibilities = var.td_requires_compatibilities
  execution_role_arn       = var.td_execution_role_arn
  task_role_arn            = var.td_task_role_arn
  cpu                      = var.td_cpu_units
  memory                   = var.td_memory

  container_definitions = jsonencode([
    {
      name        = format("%s-%s", var.prefix, var.service_name)
      image       = format("%s:%s", var.repository_url, var.image_tag)
      cpu         = 0
      essential   = true
      environment = var.cd_environmental_variables
      portMappings = [
        {
          containerPort = var.cd_port_mappings_container_port
          hostPort      = var.cd_port_mappings_host_port
          protocol      = var.cd_protocol
        }
      ]
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.this.name,
          "awslogs-region"        = var.region,
          "awslogs-stream-prefix" = format("ecs/%s-%s", var.prefix, var.service_name)
        }
      }
    }
  ])

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = format("/aws/ecs/%s", var.service_name)
  retention_in_days = 90
  tags              = merge(var.tags)
}
