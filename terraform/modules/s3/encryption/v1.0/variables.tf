variable "region" {
  description = "AWS regio in use"
  type        = string
  default     = null
}

variable "prefix" {
  description = "Used as resources ownership marker"
  type        = string
  default     = "kkalugeroff"
}

variable "enable" {
  description = "Flag used to enable bucket encryption"
  type        = bool
  default     = true
}

variable "bucket" {
  description = "Bucket name to apply restrictions on."
  type        = string
}

variable "sse_algorithm" {
  description = "SSE algorithm used for bucket encryption. Available options are AES256, aws:kms, aws:kms:dsse"
  type        = string
  default     = "AES256"
}
