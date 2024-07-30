variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = "kkalugeroff"
}

variable "origin_id" {
  description = "Unique identifier for the origin"
  type        = string
  default     = null
}

variable "domain_name" {
  description = "DNS domain name of either the S3 bucket, or web site of your custom origin"
  type        = string
  default     = null
}

variable "origin_protocol_policy" {
  description = "Origin protocol policy to apply to your origin.One of http-only, https-only, or match-viewer."
  type        = string
  default     = null
}

variable "viewer_protocol_policy" {
  description = <<-EOT
  Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. 
  One of allow-all, https-only, or redirect-to-https.
  EOT
  type        = string
  default     = "allow-all"
}

variable "origin_ssl_protocols" {
  description = " List of SSL/TLS protocols that CloudFront can use when connecting to your origin over HTTPS. Valid values: SSLv3, TLSv1, TLSv1.1, TLSv1.2"
  type        = list(string)
  default     = null
}

variable "allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "Unique identifier of the cache policy that is attached to the cache behavior. "
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "logging_config" {
  type    = map(string)
  default = {}

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
