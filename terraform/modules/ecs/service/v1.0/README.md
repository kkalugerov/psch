## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign a public IP address to the ENI (Fargate launch type only) | `bool` | `false` | no |
| <a name="input_cd_environmental_variables"></a> [cd\_environmental\_variables](#input\_cd\_environmental\_variables) | Environmental Variables set on task definition level | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `null` | no |
| <a name="input_cd_port_mappings_container_port"></a> [cd\_port\_mappings\_container\_port](#input\_cd\_port\_mappings\_container\_port) | The port number on the container instance to reserve for your container. | `number` | `null` | no |
| <a name="input_cd_port_mappings_host_port"></a> [cd\_port\_mappings\_host\_port](#input\_cd\_port\_mappings\_host\_port) | The port number on the container instance to reserve for your container. | `number` | `null` | no |
| <a name="input_cd_protocol"></a> [cd\_protocol](#input\_cd\_protocol) | The protocol used for the port mapping. Valid values are tcp and udp. | `string` | `"tcp"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Id of the cluster where service to be created | `string` | `""` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port on the container to associate with the load balancer. | `number` | `0` | no |
| <a name="input_ecs_task_deployment_maximum_percent"></a> [ecs\_task\_deployment\_maximum\_percent](#input\_ecs\_task\_deployment\_maximum\_percent) | Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. | `number` | `200` | no |
| <a name="input_ecs_task_deployment_minimum_healthy_percent"></a> [ecs\_task\_deployment\_minimum\_healthy\_percent](#input\_ecs\_task\_deployment\_minimum\_healthy\_percent) | Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. | `number` | `100` | no |
| <a name="input_ecs_task_desired_count"></a> [ecs\_task\_desired\_count](#input\_ecs\_task\_desired\_count) | Number of instances of the task definition to place and keep running. | `number` | `0` | no |
| <a name="input_health_check_enabled"></a> [health\_check\_enabled](#input\_health\_check\_enabled) | Determines whether health check will be enabled | `bool` | `true` | no |
| <a name="input_health_check_healthy_threshold"></a> [health\_check\_healthy\_threshold](#input\_health\_check\_healthy\_threshold) | Number of consecutive health check successes required before considering a target healthy. | `number` | `3` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Target Group health check internval | `number` | `60` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | The HTTP or gRPC codes to use when checking for a successful response from a target. | `string` | `"200"` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Target Group health check path | `string` | `"/"` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Protocol the load balancer uses when performing health checks on targets. | `string` | `"HTTP"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Amount of time, in seconds, during which no response from a target means a failed health check | `number` | `10` | no |
| <a name="input_health_check_ubhealthy_threshold"></a> [health\_check\_ubhealthy\_threshold](#input\_health\_check\_ubhealthy\_threshold) | Number of consecutive health check failures required before considering a target unhealthy. | `number` | `3` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | ECR image tag | `string` | `"latest"` | no |
| <a name="input_listener_certificate_arn"></a> [listener\_certificate\_arn](#input\_listener\_certificate\_arn) | ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS | `string` | `null` | no |
| <a name="input_listener_defailt_action"></a> [listener\_defailt\_action](#input\_listener\_defailt\_action) | Type of routing action. | `string` | `"forward"` | no |
| <a name="input_listener_port"></a> [listener\_port](#input\_listener\_port) | Port on which the load balancer is listening. | `number` | `0` | no |
| <a name="input_listener_protocol"></a> [listener\_protocol](#input\_listener\_protocol) | Protocol for connections from clients to the load balancer. | `string` | `""` | no |
| <a name="input_listener_ssl_policy"></a> [listener\_ssl\_policy](#input\_listener\_ssl\_policy) | Name of the SSL Policy for the listener. | `string` | `null` | no |
| <a name="input_load_balancer_arn"></a> [load\_balancer\_arn](#input\_load\_balancer\_arn) | ARN of the load balancer being used. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Used as resources ownership marker | `string` | `"kkalugeroff"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS regio in use | `string` | `"eu-west-1"` | no |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | Image repository url | `string` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL | `string` | `"FARGATE"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service | `string` | `""` | no |
| <a name="input_service_security_group_ids"></a> [service\_security\_group\_ids](#input\_service\_security\_group\_ids) | Security groups associated with the task or service. | `list(string)` | `[]` | no |
| <a name="input_service_subnet_ids"></a> [service\_subnet\_ids](#input\_service\_subnet\_ids) | Subnets associated with the task or service. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default resource tags | `map(string)` | <pre>{<br>  "DeleteMe": "No",<br>  "Deployment": "Terraform",<br>  "Owner": "Kristiyan Kalugerov"<br>}</pre> | no |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | Port on which targets receive traffic, unless overridden when registering a specific target. | `number` | `0` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | Protocol to use for routing traffic to the targets | `string` | `""` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | ALB target group type | `string` | `"ip"` | no |
| <a name="input_td_cpu_units"></a> [td\_cpu\_units](#input\_td\_cpu\_units) | Number of cpu units used by the task. | `number` | `512` | no |
| <a name="input_td_execution_role_arn"></a> [td\_execution\_role\_arn](#input\_td\_execution\_role\_arn) | Task execution role ARN | `string` | `null` | no |
| <a name="input_td_memory"></a> [td\_memory](#input\_td\_memory) | Amount (in MiB) of memory used by the task. | `number` | `1024` | no |
| <a name="input_td_network_mode"></a> [td\_network\_mode](#input\_td\_network\_mode) | Docker networking mode to use for the containers in the task. | `string` | `"awsvpc"` | no |
| <a name="input_td_requires_compatibilities"></a> [td\_requires\_compatibilities](#input\_td\_requires\_compatibilities) | Set of launch types required by the task. | `list(string)` | <pre>[<br>  "FARGATE"<br>]</pre> | no |
| <a name="input_td_task_role_arn"></a> [td\_task\_role\_arn](#input\_td\_task\_role\_arn) | Task role ARN | `string` | `null` | no |
| <a name="input_usage"></a> [usage](#input\_usage) | What resource is used for | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where target group needs to be created | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | ARN that identifies the service |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the service |
| <a name="output_task_definition_arn"></a> [task\_definition\_arn](#output\_task\_definition\_arn) | Full ARN of the Task Definition (including both `family` and `revision`) |
| <a name="output_task_definition_family"></a> [task\_definition\_family](#output\_task\_definition\_family) | The unique name of the task definition |
| <a name="output_task_definition_revision"></a> [task\_definition\_revision](#output\_task\_definition\_revision) | Revision of the task in a particular family |
