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

AWS IAM Policy Module

## Resources

| Name                                                                                                            | Type     |
| --------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |

## Inputs

| Name                                                               | Description                              | Type          | Default                                                                                                   | Required |
| ------------------------------------------------------------------ | ---------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_description"></a> [description](#input_description) | The description of the policy            | `string`      | `"IAM Policy"`                                                                                            |    no    |
| <a name="input_name"></a> [name](#input_name)                      | The name of the policy                   | `string`      | `""`                                                                                                      |    no    |
| <a name="input_path"></a> [path](#input_path)                      | The path of the policy in IAM            | `string`      | `"/"`                                                                                                     |    no    |
| <a name="input_policy"></a> [policy](#input_policy)                | The path of the policy in IAM (tpl file) | `string`      | `""`                                                                                                      |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                | Used as resources ownership marker       | `string`      | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                      | Default resource tags                    | `map(string)` | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |

## Outputs

| Name                                                                 | Description                            |
| -------------------------------------------------------------------- | -------------------------------------- |
| <a name="output_arn"></a> [arn](#output_arn)                         | The ARN assigned by AWS to this policy |
| <a name="output_description"></a> [description](#output_description) | The description of the policy          |
| <a name="output_id"></a> [id](#output_id)                            | The policy ID                          |
| <a name="output_name"></a> [name](#output_name)                      | The name of the policy                 |
| <a name="output_path"></a> [path](#output_path)                      | The path of the policy in IAM          |
| <a name="output_policy"></a> [policy](#output_policy)                | The policy document                    |
