data "terraform_remote_state" "alb_sg" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/security_groups/alb/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/network/terraform.tfstate"
    region = "eu-west-1"
  }
}
