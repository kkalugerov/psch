variable "region" {
  description = "AWS region in use"
  type        = string
  default     = "eu-west-1"
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "name" {
  description = "Repository name"
  type        = string
}

variable "mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "If true, will delete the repository even if it contains images."
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "The encryption type to use for the repository. Valid values are AES256 or KMS"
  type        = string
  default     = "AES256"
}

variable "kms_key_arn" {
  description = "KMS key ARN used if encryption type is KMS"
  type        = string
  default     = null
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
