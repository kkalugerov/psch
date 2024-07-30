variable "bucket" {
  description = "S3 bucket to apply acl on"
  type        = string
}

variable "grants" {
  description = "Configuration block for entity being granted permissions"
  type        = map(any)
  default     = {}
}
