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

AWS RDS Subnet Group Module

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | RDS Subnet Group description | `string` | `null` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The name of the RDS instance | `string` | `"kkalugeroff"` | no |
| <a name="input_name"></a> [name](#input\_name) | RDS Subnet Group name | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region in use | `string` | `"eu-west-1"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs part of RDS Subnet Group | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default resource tags | `map(string)` | <pre>{<br>  "DeleteMe": "No",<br>  "Deployment": "Terraform",<br>  "Owner": "Kristiyan Kalugerov"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
