## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 5.6.0 |

## Providers

| Name                                             | Version  |
| ------------------------------------------------ | -------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 5.6.0 |

## Modules

AWS IAM ELB Module

## Resources

| Name                                                                                          | Type     |
| --------------------------------------------------------------------------------------------- | -------- |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |

## Inputs

| Name                                                                                                                              | Description                                                                                                                                              | Type                | Default                                                                                                   | Required |
| --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_access_logs"></a> [access_logs](#input_access_logs)                                                                | Map containing access logging configuration for load balancer.                                                                                           | `map(string)`       | `{}`                                                                                                      |    no    |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable_cross_zone_load_balancing](#input_enable_cross_zone_load_balancing) | Indicates whether cross zone load balancing should be enabled in application load balancers.                                                             | `bool`              | `false`                                                                                                   |    no    |
| <a name="input_enable_deletion_protection"></a> [enable_deletion_protection](#input_enable_deletion_protection)                   | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false. | `bool`              | `false`                                                                                                   |    no    |
| <a name="input_enable_http2"></a> [enable_http2](#input_enable_http2)                                                             | Indicates whether HTTP/2 is enabled in application load balancers.                                                                                       | `bool`              | `true`                                                                                                    |    no    |
| <a name="input_idle_timeout"></a> [idle_timeout](#input_idle_timeout)                                                             | The time in seconds that the connection is allowed to be idle.                                                                                           | `number`            | `300`                                                                                                     |    no    |
| <a name="input_internal"></a> [internal](#input_internal)                                                                         | Boolean determining if the load balancer is internal or externally facing.                                                                               | `bool`              | `false`                                                                                                   |    no    |
| <a name="input_ip_address_type"></a> [ip_address_type](#input_ip_address_type)                                                    | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack.                                         | `string`            | `"ipv4"`                                                                                                  |    no    |
| <a name="input_load_balancer_create_timeout"></a> [load_balancer_create_timeout](#input_load_balancer_create_timeout)             | Timeout value when creating the ALB.                                                                                                                     | `string`            | `"10m"`                                                                                                   |    no    |
| <a name="input_load_balancer_delete_timeout"></a> [load_balancer_delete_timeout](#input_load_balancer_delete_timeout)             | Timeout value when deleting the ALB.                                                                                                                     | `string`            | `"10m"`                                                                                                   |    no    |
| <a name="input_load_balancer_type"></a> [load_balancer_type](#input_load_balancer_type)                                           | The type of load balancer to create. Possible values are application or network.                                                                         | `string`            | n/a                                                                                                       |   yes    |
| <a name="input_load_balancer_update_timeout"></a> [load_balancer_update_timeout](#input_load_balancer_update_timeout)             | Timeout value when updating the ALB.                                                                                                                     | `string`            | `"10m"`                                                                                                   |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                     | The resource name and Name tag of the load balancer.                                                                                                     | `string`            | n/a                                                                                                       |   yes    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                                                               | Used as resources ownership marker                                                                                                                       | `string`            | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_region"></a> [region](#input_region)                                                                               | AWS region in use                                                                                                                                        | `string`            | `"eu-west-1"`                                                                                             |    no    |
| <a name="input_security_groups"></a> [security_groups](#input_security_groups)                                                    | The security groups to attach to the load balancer.                                                                                                      | `list(string)`      | `[]`                                                                                                      |    no    |
| <a name="input_subnet_mapping"></a> [subnet_mapping](#input_subnet_mapping)                                                       | A list of subnet mapping blocks describing subnets to attach to network load balancer                                                                    | `list(map(string))` | `[]`                                                                                                      |    no    |
| <a name="input_subnets"></a> [subnets](#input_subnets)                                                                            | A list of subnets to associate with the load balancer.                                                                                                   | `list(string)`      | `null`                                                                                                    |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                                     | Default resource tags                                                                                                                                    | `map(string)`       | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                               | VPC id where the load balancer and other resources will be deployed.                                                                                     | `string`            | `null`                                                                                                    |    no    |

## Outputs

| Name                                                                 | Description                                                           |
| -------------------------------------------------------------------- | --------------------------------------------------------------------- |
| <a name="output_lb_arn"></a> [lb_arn](#output_lb_arn)                | The ARN of the Load Balancer we created.                              |
| <a name="output_lb_dns_name"></a> [lb_dns_name](#output_lb_dns_name) | The DNS name of the load balancer.                                    |
| <a name="output_lb_id"></a> [lb_id](#output_lb_id)                   | The ID of the Load Balancer.                                          |
| <a name="output_lb_name"></a> [lb_name](#output_lb_name)             | Load Balancer name                                                    |
| <a name="output_lb_zone_id"></a> [lb_zone_id](#output_lb_zone_id)    | The zone_id of the load balancer to assist with creating DNS records. |
