variable "enable" {
  description = "Flag used to set or not public access blockage"
  type        = bool
  default     = true
}

variable "bucket" {
  description = "Bucket name to apply restrictions on."
  type        = string
}

variable "public_access" {
  description = "Set default public access policy for S3 bucket"
  type        = map(string)
  default = {
    block_public_acls       = "true"
    block_public_policy     = "true"
    ignore_public_acls      = "true"
    restrict_public_buckets = "true"
  }
}
