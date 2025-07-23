variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name to use for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default     = {}
}