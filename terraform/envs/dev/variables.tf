variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "May-Key-Pair"
}

variable "vpc_id" {
  description = "VPC ID (leave empty to use default VPC)"
  type        = string
  default     = ""
}