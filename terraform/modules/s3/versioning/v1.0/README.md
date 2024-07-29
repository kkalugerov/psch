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

AWS S3 Versioning Module

## Resources

| Name                                                                                                                                    | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name                                                                                 | Description                 | Type          | Default | Required |
| ------------------------------------------------------------------------------------ | --------------------------- | ------------- | ------- | :------: |
| <a name="input_bucket"></a> [bucket](#input_bucket)                                  | S3 bucket name              | `string`      | n/a     |   yes    |
| <a name="input_enable"></a> [enable](#input_enable)                                  | Enable versionig?           | `bool`        | `true`  |    no    |
| <a name="input_versioning_inputs"></a> [versioning_inputs](#input_versioning_inputs) | S3 versioning configuration | `map(string)` | `null`  |    no    |

## Outputs

No outputs.
