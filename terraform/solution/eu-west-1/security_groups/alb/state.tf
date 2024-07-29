terraform {
  backend "s3" {
    encrypt = true
    bucket  = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key     = "solution/eu-west-1/security_groups/alb/terraform.tfstate"
    region  = "eu-west-1"
  }
}