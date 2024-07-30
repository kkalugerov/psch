provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      "Deployment" = "Terraform"
      "Owner"      = "Kristiyan Kalugerov"
      "DeleteMe"   = "No"
    }
  }
}

module "cluster" {
  source       = "../../../../modules/ecs/cluster/v1.0"
  cluster_name = "kkalugeroff-ecs"
  cluster_service_connect_defaults = {
    "namespace" = "arn:aws:servicediscovery:eu-west-1:555256523315:namespace/ns-cqe4hebqpeo2cau6"
  }
}

output "cluster_id" {
  value = module.cluster.cluster_id
}

output "cluster_name" {
  value = module.cluster.cluster_name
}
