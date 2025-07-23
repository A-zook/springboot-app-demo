resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  user_data              = var.user_data

  tags = merge(
    {
      Name = "DevOps-EC2-Instance"
    },
    var.tags
  )

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
    encrypted   = true
  }
}