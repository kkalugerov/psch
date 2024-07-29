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

No modules.

## Resources

| Name                                                                                                                                                      | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                        | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                                  | resource |
| [aws_nat_gateway.ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                            | resource |
| [aws_route_table.db_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                          | resource |
| [aws_route_table.private_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                     | resource |
| [aws_route_table.public_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                      | resource |
| [aws_route_table_association.db_association_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)      | resource |
| [aws_route_table_association.db_association_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)      | resource |
| [aws_route_table_association.private_association_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_association_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_association_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.public_association_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_subnet.db_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                    | resource |
| [aws_subnet.db_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                    | resource |
| [aws_subnet.private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                               | resource |
| [aws_subnet.private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                               | resource |
| [aws_subnet.public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                | resource |
| [aws_subnet.public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                           | resource |

## Inputs

| Name                                                                           | Description                        | Type          | Default                                                                                                   | Required |
| ------------------------------------------------------------------------------ | ---------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_db_1a_cidr"></a> [db_1a_cidr](#input_db_1a_cidr)                | VPC DB Subnet CIDR in AZ 1b        | `string`      | `"10.0.5.0/24"`                                                                                           |    no    |
| <a name="input_db_1b_cidr"></a> [db_1b_cidr](#input_db_1b_cidr)                | VPC DB Subnet CIDR in AZ 1b        | `string`      | `"10.0.6.0/24"`                                                                                           |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                            | Used as resources ownership marker | `string`      | `"kkalugeroff"`                                                                                           |    no    |
| <a name="input_private_1a_cidr"></a> [private_1a_cidr](#input_private_1a_cidr) | VPC Private Subnet CIDR in AZ 1b   | `string`      | `"10.0.3.0/24"`                                                                                           |    no    |
| <a name="input_private_1b_cidr"></a> [private_1b_cidr](#input_private_1b_cidr) | VPC Private Subnet CIDR in AZ 1b   | `string`      | `"10.0.4.0/24"`                                                                                           |    no    |
| <a name="input_public_1a_cidr"></a> [public_1a_cidr](#input_public_1a_cidr)    | VPC Public Subnet CIDR in AZ 1a    | `string`      | `"10.0.1.0/24"`                                                                                           |    no    |
| <a name="input_public_1b_cidr"></a> [public_1b_cidr](#input_public_1b_cidr)    | VPC Public Subnet CIDR in AZ 1b    | `string`      | `"10.0.2.0/24"`                                                                                           |    no    |
| <a name="input_region"></a> [region](#input_region)                            | AWS regio in use                   | `string`      | `"eu-west-1"`                                                                                             |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                  | Default resource tags              | `map(string)` | <pre>{<br> "DeleteMe": "No",<br> "Deployment": "Terraform",<br> "Owner": "Kristiyan Kalugerov"<br>}</pre> |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                      | VPC CIDR block                     | `string`      | `"10.0.0.0/16"`                                                                                           |    no    |

## Outputs

No outputs.
