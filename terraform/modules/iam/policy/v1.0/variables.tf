variable "prefix" {
  description = "Used as resources ownership marker"
  type        = string
  default     = "kkalugeroff"
}

variable "name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
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
