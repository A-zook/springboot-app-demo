variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to use (default VPC if empty)"
  type        = string
  default     = ""
}

variable "create_security_group" {
  description = "Whether to create a security group"
  type        = bool
  default     = true
}