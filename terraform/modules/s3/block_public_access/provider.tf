terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.6.0"
    }
  }

  required_version = "~> 1.1.0"
}
