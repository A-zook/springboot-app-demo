provider "aws" {
  region = var.region
}

# Get Ubuntu AMI ID for the specified region
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Load user data script
data "template_file" "user_data" {
  template = file("${path.module}/../../user_data/install.sh")
}

# Create network resources
module "network" {
  source = "../../modules/network"

  region = var.region
  vpc_id = var.vpc_id
}

# Create EC2 instance
module "ec2" {
  source = "../../modules/ec2"

  ami_id            = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.network.subnet_id
  security_group_ids = [module.network.security_group_id]
  user_data         = data.template_file.user_data.rendered

  tags = {
    Name        = "DevOps-EC2"
    Environment = "dev"
  }
}

# Output the connection information
output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.instance_public_ip
}

output "ssh_command" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${module.ec2.instance_public_ip}"
}

output "jenkins_url" {
  value = "http://${module.ec2.instance_public_ip}:8080"
}