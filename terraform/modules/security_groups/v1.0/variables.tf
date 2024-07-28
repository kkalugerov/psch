variable "region" {
  description = "AWS regio in use"
  type        = string
  default     = "eu-west-1"
}

variable "prefix" {
  description = "Used as resources ownership marker"
  type        = string
  default     = "kkalugeroff"
}

variable "usage" {
  description = "Security Group Used by"
  type        = string
}

variable "description" {
  description = "Security Group Purpose"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress security group rules"
  type        = map(any)
}

variable "egress_rules" {
  description = "List of ingress security group rules"
  type        = map(any)
}

variable "tags" {
  description = "Default resource tags"
  type        = map(string)
  default = {
    "Deployment" = "Terraform"
    "Owner"      = "Kristiyan Kalugerov"
    "DeleteMe"   = "No"
  }
}
