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
  #   ssl_policy        = "ELBSecurityPolicy-2016-08"
  #   certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  # default_action {
  #   type             = "forward"
  #   target_group_arn = aws_lb_target_group.acox_tg.arn
  # }
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
