variable "enable" {
  description = "Enable versionig?"
  type        = bool
  default     = true
}

variable "bucket" {
  description = "S3 bucket name"
  type        = string
}

variable "versioning_inputs" {
  description = "S3 versioning configuration"
  type        = map(string)
  default     = null
}
