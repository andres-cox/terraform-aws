resource "aws_lb_target_group" "acox_tg" {
  name        = var.tg_name
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    interval            = 5
    timeout             = 4
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.acox_tg.arn
  target_id        = var.target_id
  port             = 80
}


resource "aws_lb_listener_rule" "static" {
  listener_arn = var.listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.acox_tg.arn
  }

  condition {
    path_pattern {
      values = [var.condition]
    }
  }
}
