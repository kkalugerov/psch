data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/network/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_ec2_managed_prefix_list" "cloudfront" {
 name = "com.amazonaws.global.cloudfront.origin-facing"
}