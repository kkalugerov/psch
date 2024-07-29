variable "region" {
  description = "AWS region in use"
  type        = string
  default     = "eu-west-1"
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "kkalugeroff"
}

variable "name" {
  description = "RDS Subnet Group name"
  type        = string
  default     = null
}

variable "description" {
  description = "RDS Subnet Group description"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Subnet IDs part of RDS Subnet Group"
  type        = list(string)
  default     = []
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