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

AWS IAM Role Module. The module allows to attach multiple policies to IAM Role.

## Resources

| Name                                                                                                                                                              | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                         | resource    |
| [aws_iam_role_policy_attachment.custom_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource    |
| [aws_iam_policy_document.assume_role_principal_aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)           | data source |
| [aws_iam_policy_document.assume_role_principal_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)       | data source |
| [aws_iam_policy_document.assume_role_with_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                | data source |

## Inputs

| Name                                                                                                                     | Description                                                        | Type           | Default                                                                                                   | Required |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------ | -------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_create_instance_profile"></a> [create_instance_profile](#input_create_instance_profile)                   | Whether to create an instance profile                              | `bool`         | `false`                                                                                                   |    no    |
| <a name="input_custom_role_policy_arns"></a> [custom_role_policy_arns](#input_custom_role_policy_arns)                   | List of ARNs of IAM policies to attach to IAM role                 | `list(string)` | `[]`                                                                                                      |    no    |
| <a name="input_max_session_duration"></a> [max_session_duration](#input_max_session_duration)                            | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number`       | `3600`                                                                                                    |    no    |
| <a name="input_mfa_age"></a> [mfa_age](#input_mfa_age)                                                                   | Max age of valid MFA (in seconds) for roles which require MFA      | `number`       | `86400`                                                                                                   |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                                                      | Used as resources ownership marker                                 | `string`       | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_principal"></a> [principal](#input_principal)                                                             | IAM assume role document marker                                    | `string`       | `"Service"`                                                                                               |    no    |
| <a name="input_role_description"></a> [role_description](#input_role_description)                                        | IAM Role description                                               | `string`       | `""`                                                                                                      |    no    |
| <a name="input_role_name"></a> [role_name](#input_role_name)                                                             | IAM role name                                                      | `string`       | n/a                                                                                                       |   yes    |
| <a name="input_role_path"></a> [role_path](#input_role_path)                                                             | Path of IAM role                                                   | `string`       | `"/"`                                                                                                     |    no    |
| <a name="input_role_permissions_boundary_arn"></a> [role_permissions_boundary_arn](#input_role_permissions_boundary_arn) | Permissions boundary ARN to use for IAM role                       | `string`       | `""`                                                                                                      |    no    |
| <a name="input_role_requires_mfa"></a> [role_requires_mfa](#input_role_requires_mfa)                                     | Whether role requires MFA                                          | `bool`         | `false`                                                                                                   |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                            | Default resource tags                                              | `map(string)`  | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |
| <a name="input_trusted_role_arns"></a> [trusted_role_arns](#input_trusted_role_arns)                                     | ARNs of AWS entities who can assume these roles                    | `list(string)` | `[]`                                                                                                      |    no    |
| <a name="input_trusted_role_services"></a> [trusted_role_services](#input_trusted_role_services)                         | AWS Services that can assume these roles                           | `list(string)` | `[]`                                                                                                      |    no    |

## Outputs

| Name                                                           | Description      |
| -------------------------------------------------------------- | ---------------- |
| <a name="output_role_arn"></a> [role_arn](#output_role_arn)    | ARN of IAM role  |
| <a name="output_role_id"></a> [role_id](#output_role_id)       | IAM role id      |
| <a name="output_role_name"></a> [role_name](#output_role_name) | Name of IAM role |
| <a name="output_role_path"></a> [role_path](#output_role_path) | Path of IAM role |
