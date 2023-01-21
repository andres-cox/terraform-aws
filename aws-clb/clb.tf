# Create a new load balancer
resource "aws_elb" "acox_clb" {
  name               = "acox-clb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  security_groups    = [aws_security_group.acox_clb_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 5
    target              = "HTTP:80/"
  }

  instances = [
    module.acox_instance_1.instance_id,
    module.acox_instance_2.instance_id,
    module.acox_instance_3.instance_id
  ]
  cross_zone_load_balancing   = true
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "acox-clb"
  }
}