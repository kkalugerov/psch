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
