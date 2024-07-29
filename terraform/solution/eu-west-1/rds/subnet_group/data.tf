data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/network/terraform.tfstate"
    region = "eu-west-1"
  }
}
