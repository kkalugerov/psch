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

AWS IAM Role Module. The module allows to attach multiple policies to IAM Role.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_principal_aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_principal_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_with_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | Whether to create an instance profile | `bool` | `false` | no |
| <a name="input_custom_role_policy_arns"></a> [custom\_role\_policy\_arns](#input\_custom\_role\_policy\_arns) | List of ARNs of IAM policies to attach to IAM role | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `3600` | no |
| <a name="input_mfa_age"></a> [mfa\_age](#input\_mfa\_age) | Max age of valid MFA (in seconds) for roles which require MFA | `number` | `86400` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Used as resources ownership marker | `string` | `"kkalugeroff"` | no |
| <a name="input_principal"></a> [principal](#input\_principal) | IAM assume role document marker | `string` | `"Service"` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | IAM Role description | `string` | `""` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM role name | `string` | n/a | yes |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path of IAM role | `string` | `"/"` | no |
| <a name="input_role_permissions_boundary_arn"></a> [role\_permissions\_boundary\_arn](#input\_role\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `""` | no |
| <a name="input_role_requires_mfa"></a> [role\_requires\_mfa](#input\_role\_requires\_mfa) | Whether role requires MFA | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default resource tags | `map(string)` | <pre>{<br>  "DeleteMe": "No",<br>  "Deployment": "Terraform",<br>  "Owner": "Kristiyan Kalugerov"<br>}</pre> | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume these roles | `list(string)` | `[]` | no |
| <a name="input_trusted_role_services"></a> [trusted\_role\_services](#input\_trusted\_role\_services) | AWS Services that can assume these roles | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of IAM role |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | IAM role id |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of IAM role |
| <a name="output_role_path"></a> [role\_path](#output\_role\_path) | Path of IAM role |
