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

AWS S3 Block Public Module

## Resources

| Name                                                                                                                                                               | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [aws_s3_bucket_public_access_block.block_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name                                                                     | Description                                    | Type          | Default                                                                                                                                                       | Required |
| ------------------------------------------------------------------------ | ---------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                      | Bucket name to apply restrictions on.          | `string`      | n/a                                                                                                                                                           |   yes    |
| <a name="input_enable"></a> [enable](#input_enable)                      | Flag used to set or not public access blockage | `bool`        | `true`                                                                                                                                                        |    no    |
| <a name="input_public_access"></a> [public_access](#input_public_access) | Set default public access policy for S3 bucket | `map(string)` | <pre>{<br> "block_public_acls": "true",<br> "block_public_policy": "true",<br> "ignore_public_acls": "true",<br> "restrict_public_buckets": "true"<br>}</pre> |    no    |
| <a name="input_region"></a> [region](#input_region)                      | AWS regio in use                               | `string`      | `"eu-west-1"`                                                                                                                                                 |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                            | Default resource tags                          | `map(string)` | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre>                                                     |    no    |

## Outputs

No outputs.
