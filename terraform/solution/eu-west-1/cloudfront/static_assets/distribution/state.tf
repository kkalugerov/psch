terraform {
  backend "s3" {
    encrypt = true
    bucket  = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key     = "solution/eu-west-1/cloudfront/static_assets/distribution/terraform.tfstate"
    region  = "eu-west-1"
  }
}