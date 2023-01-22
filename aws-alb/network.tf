# Using default VPC with 2 AZ subnets
resource "aws_default_vpc" "vpc_default" {

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
    description = "HTTP connection for Load Balancer"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # security_groups = [aws_security_group.acox_alb_sg.id]
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
