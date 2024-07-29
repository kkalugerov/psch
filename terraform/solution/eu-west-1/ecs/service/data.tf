data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/network/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "security_groups" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/security_groups/ecs/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "elb" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/elb/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/ecs/cluster/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/iam/ecs/service/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "ecr" {
  backend = "s3"

  config = {
    bucket = "kkalugeroff-eu-west-1-terraform-state-bucket"
    key    = "solution/eu-west-1/ecr/app/terraform.tfstate"
    region = "eu-west-1"
  }
}
