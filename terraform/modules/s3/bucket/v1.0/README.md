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

AWS S3 Module

## Resources

| Name                                                                                                        | Type     |
| ----------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name                                                                                    | Description                                                                                                                                                                             | Type          | Default                                                                                                   | Required |
| --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                                     | (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.                                                                        | `string`      | n/a                                                                                                       |   yes    |
| <a name="input_bucket_description"></a> [bucket_description](#input_bucket_description) | This is the bucket description                                                                                                                                                          | `string`      | n/a                                                                                                       |   yes    |
| <a name="input_force_destroy"></a> [force_destroy](#input_force_destroy)                | (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool`        | `false`                                                                                                   |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                     | Used as resources ownership marker                                                                                                                                                      | `string`      | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_region"></a> [region](#input_region)                                     | AWS regio in use                                                                                                                                                                        | `string`      | `"eu-west-1"`                                                                                             |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                           | Default resource tags                                                                                                                                                                   | `map(string)` | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |

## Outputs

| Name                                                                 | Description      |
| -------------------------------------------------------------------- | ---------------- |
| <a name="output_bucket_arn"></a> [bucket_arn](#output_bucket_arn)    | ARN of S3 bucket |
| <a name="output_bucket_id"></a> [bucket_id](#output_bucket_id)       | ID of S3 bucket  |
| <a name="output_bucket_name"></a> [bucket_name](#output_bucket_name) | S3 Bucket name   |
