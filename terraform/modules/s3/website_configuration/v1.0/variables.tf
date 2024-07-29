variable "bucket" {
  description = "S3 Bucket used for website config"
  type        = string
  default     = null
}

variable "index_document_suffix" {
  description = "Name of the index document for the website"
  type        = string
  default     = "index.html"
}

variable "error_document_key" {
  description = "Name of the error document for the website"
  type        = string
  default     = "error.html"
}

variable "routing_rule_condition_key_prefix_equals" {
  description = "Object key name prefix when the redirect is applied."
  type        = string
  default     = null
}

variable "routing_rule_redirect_replace_key_prefix_with" {
  description = "Object key prefix to use in the redirect request."
  type        = string
  default     = null
}
