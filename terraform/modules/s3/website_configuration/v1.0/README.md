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

AWS S3 WebSite Configuration Module

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | S3 Bucket used for website config | `string` | `null` | no |
| <a name="input_error_document_key"></a> [error\_document\_key](#input\_error\_document\_key) | Name of the error document for the website | `string` | `"error.html"` | no |
| <a name="input_index_document_suffix"></a> [index\_document\_suffix](#input\_index\_document\_suffix) | Name of the index document for the website | `string` | `"index.html"` | no |
| <a name="input_routing_rule_condition_key_prefix_equals"></a> [routing\_rule\_condition\_key\_prefix\_equals](#input\_routing\_rule\_condition\_key\_prefix\_equals) | Object key name prefix when the redirect is applied. | `string` | `null` | no |
| <a name="input_routing_rule_redirect_replace_key_prefix_with"></a> [routing\_rule\_redirect\_replace\_key\_prefix\_with](#input\_routing\_rule\_redirect\_replace\_key\_prefix\_with) | Object key prefix to use in the redirect request. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_website_domain"></a> [website\_domain](#output\_website\_domain) | n/a |
| <a name="output_website_endpoint"></a> [website\_endpoint](#output\_website\_endpoint) | n/a |
