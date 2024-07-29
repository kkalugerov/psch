data "terraform_remote_state" "static_web_origin" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/static_web/origin/terraform.tfstate"
    region = "eu-west-1"
  }
}
