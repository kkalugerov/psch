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

AWS Security Group with Rules Module

## Resources

| Name                                                                                                                                                             | Type     |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                            | resource |
| [aws_vpc_security_group_egress_rule.egress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule)    | resource |
| [aws_vpc_security_group_ingress_rule.ingress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name                                                                     | Description                                  | Type          | Default                                                                                                   | Required |
| ------------------------------------------------------------------------ | -------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_description"></a> [description](#input_description)       | Security Group Purpose                       | `string`      | n/a                                                                                                       |   yes    |
| <a name="input_egress_rules"></a> [egress_rules](#input_egress_rules)    | List of ingress security group rules         | `map(any)`    | n/a                                                                                                       |   yes    |
| <a name="input_ingress_rules"></a> [ingress_rules](#input_ingress_rules) | List of ingress security group rules         | `map(any)`    | n/a                                                                                                       |   yes    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                      | Used as resources ownership marker           | `string`      | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_region"></a> [region](#input_region)                      | AWS regio in use                             | `string`      | `"eu-west-1"`                                                                                             |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                            | Default resource tags                        | `map(string)` | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |
| <a name="input_usage"></a> [usage](#input_usage)                         | Security Group Used by                       | `string`      | n/a                                                                                                       |   yes    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                      | ID of the VPC where to create security group | `string`      | n/a                                                                                                       |   yes    |

## Outputs

| Name                                                                                   | Description |
| -------------------------------------------------------------------------------------- | ----------- |
| <a name="output_security_group_id"></a> [security_group_id](#output_security_group_id) | n/a         |
