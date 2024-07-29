variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "kkalugeroff"
}

variable "origin_id" {
  type    = string
  default = null
}

variable "domain_name" {
  type    = string
  default = null
}

variable "allowed_methods" {
  type    = list(string)
  default = ["GET", "HEAD"]
}

variable "cached_methods" {
  type    = list(string)
  default = ["GET", "HEAD"]
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
