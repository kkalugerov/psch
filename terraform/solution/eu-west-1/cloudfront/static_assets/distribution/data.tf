data "terraform_remote_state" "static_web_origin" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/cloudfront/static_assets/origin/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "bucket" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/cloudfront/static_assets/logging/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_canonical_user_id" "current" {}
