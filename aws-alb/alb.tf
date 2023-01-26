resource "aws_lb" "acox_alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.acox_alb_sg.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  enable_deletion_protection = false

  tags = {
    Environment = "acox-alb"
  }
}

# resource "aws_lb_listener" "acox_alb_listener" {
#   load_balancer_arn = aws_lb.acox_alb.arn
#   port              = "80"
#   protocol          = "HTTP"
#   #   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   #   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.acox_tg.arn
#   }
# }

resource "aws_security_group" "acox_alb_sg" {
  name        = "acox-alb-http"
  description = "Allow HTTP traffic"
  vpc_id      = aws_vpc.main.id

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
