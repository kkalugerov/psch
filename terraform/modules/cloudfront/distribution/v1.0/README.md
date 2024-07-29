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

AWS CloudFront Distribution module

## Resources

| Name                                                                                                                                    | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name                                                                           | Description                  | Type           | Default                                                                                                   | Required |
| ------------------------------------------------------------------------------ | ---------------------------- | -------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_allowed_methods"></a> [allowed_methods](#input_allowed_methods) | n/a                          | `list(string)` | <pre>[<br> "GET",<br> "HEAD"<br>]</pre>                                                                   |    no    |
| <a name="input_cached_methods"></a> [cached_methods](#input_cached_methods)    | n/a                          | `list(string)` | <pre>[<br> "GET",<br> "HEAD"<br>]</pre>                                                                   |    no    |
| <a name="input_domain_name"></a> [domain_name](#input_domain_name)             | n/a                          | `string`       | `null`                                                                                                    |    no    |
| <a name="input_identifier"></a> [identifier](#input_identifier)                | The name of the RDS instance | `string`       | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_origin_id"></a> [origin_id](#input_origin_id)                   | n/a                          | `string`       | `null`                                                                                                    |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                  | Default resource tags        | `map(string)`  | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |

## Outputs

| Name                                                                 | Description |
| -------------------------------------------------------------------- | ----------- |
| <a name="output_domain_name"></a> [domain_name](#output_domain_name) | n/a         |
