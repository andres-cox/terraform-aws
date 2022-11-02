resource "aws_instance" "acox_instance_1" {
  ami               = var.instance_ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone_1

  tags = {
    Name = var.instance_name
  }
  security_groups = ["${aws_security_group.acox_sg.name}"]
  key_name        = var.aws_key_name

}

resource "aws_instance" "acox_instance_2" {
  ami               = var.instance_ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone_2

  tags = {
    Name = var.instance_name
  }
  security_groups = ["${aws_security_group.acox_sg.name}"]
  key_name        = var.aws_key_name

}

resource "aws_efs_file_system" "acox_efs" {
  creation_token = "my-product"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "acox-efs"
  }
}

resource "aws_security_group" "acox_sg" {
  name        = "acox-ssh-http"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "SSH connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-ssh-http"
  }
}