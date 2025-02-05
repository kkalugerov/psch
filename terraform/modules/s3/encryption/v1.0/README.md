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

AWS S3 Encryption Module

## Resources

| Name                                                                                                                                                                                                      | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_kms_alias.encryption_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias)                                                                               | resource |
| [aws_kms_key.encryption_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)                                                                                         | resource |
| [aws_s3_bucket_server_side_encryption_configuration.encryption_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## Inputs

| Name                                                                     | Description                                                                                   | Type          | Default                                                                                                   | Required |
| ------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                      | Bucket name to apply restrictions on.                                                         | `string`      | n/a                                                                                                       |   yes    |
| <a name="input_enable"></a> [enable](#input_enable)                      | Flag used to enable bucket encryption                                                         | `bool`        | `true`                                                                                                    |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                      | Used as resources ownership marker                                                            | `string`      | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_region"></a> [region](#input_region)                      | AWS regio in use                                                                              | `string`      | `"eu-west-1"`                                                                                             |    no    |
| <a name="input_sse_algorithm"></a> [sse_algorithm](#input_sse_algorithm) | SSE algorithm used for bucket encryption. Available options are AES256, aws:kms, aws:kms:dsse | `string`      | `"AES256"`                                                                                                |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                            | Default resource tags                                                                         | `map(string)` | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |

## Outputs

No outputs.
