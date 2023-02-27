resource "aws_lb" "acox_alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg_ids
  subnets            = var.alb_subnets

  enable_deletion_protection = false

  tags = {
    Environment = "acox-alb"
  }
}

resource "aws_lb_listener" "acox_alb_listener" {
  load_balancer_arn = aws_lb.acox_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
