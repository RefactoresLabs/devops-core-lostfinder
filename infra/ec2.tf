resource "aws_instance" "lostfinder_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  security_groups = [
    aws_security_group.lostfinder_sg.name
  ]

  user_data = file("user-data.sh")

  tags = {
    Name = "${var.project_name}-ec2"
  }
}