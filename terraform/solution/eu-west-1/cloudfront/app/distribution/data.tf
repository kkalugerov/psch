data "terraform_remote_state" "elb" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/elb/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "bucket" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/cloudfront/app/logging/terraform.tfstate"
    region = "eu-west-1"
  }
}
