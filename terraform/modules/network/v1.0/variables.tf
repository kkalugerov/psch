variable "region" {
  description = "AWS regio in use"
  type        = string
  default     = "eu-west-1"
}

variable "prefix" {
  description = "Used as resources ownership marker"
  type        = string
  default     = "kkalugeroff"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_1a_cidr" {
  description = "VPC Public Subnet CIDR in AZ 1a "
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_1b_cidr" {
  description = "VPC Public Subnet CIDR in AZ 1b"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_1a_cidr" {
  description = "VPC Private Subnet CIDR in AZ 1b"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_1b_cidr" {
  description = "VPC Private Subnet CIDR in AZ 1b"
  type        = string
  default     = "10.0.4.0/24"
}

variable "db_1a_cidr" {
  description = "VPC DB Subnet CIDR in AZ 1b"
  type        = string
  default     = "10.0.5.0/24"
}

variable "db_1b_cidr" {
  description = "VPC DB Subnet CIDR in AZ 1b"
  type        = string
  default     = "10.0.6.0/24"
}
