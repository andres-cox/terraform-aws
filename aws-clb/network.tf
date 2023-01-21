# Using default VPC with 2 AZ subnets
resource "aws_default_vpc" "vpc_default" {

}

resource "aws_default_subnet" "subnet_ec2_1" {
  availability_zone = "us-east-1a"
}

resource "aws_default_subnet" "subnet_ec2_2" {
  availability_zone = "us-east-1b"
}

resource "aws_security_group" "acox_ec2_sg" {
  name        = "acox-ssh-http"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_default_vpc.vpc_default.id

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
    description      = "Internet Access"
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

resource "aws_security_group" "acox_clb_sg" {
  name        = "acox-clb-http"
  description = "Allow HTTP traffic"
  vpc_id      = aws_default_vpc.vpc_default.id

  ingress {
    description = "HTTP connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Internet Access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-http"
  }
}
