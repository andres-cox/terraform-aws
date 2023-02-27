resource "aws_launch_configuration" "aws_lc" {
  name            = "acox-launch-configuration"
  image_id        = var.instance_ami
  instance_type   = var.instance_type
  security_groups = var.vpc_security_group_ids
  user_data       = file("${path.module}/startup.sh")
  key_name        = var.aws_key_name
}

resource "aws_placement_group" "aws_pg" {
  name     = "acox-placement-group"
  strategy = "partition"
}

resource "aws_autoscaling_group" "aws_asg" {
  name                      = "acox-asg"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  placement_group           = aws_placement_group.aws_pg.id
  launch_configuration      = aws_launch_configuration.aws_lc.name
  vpc_zone_identifier       = var.asg_subnets
}

resource "aws_autoscaling_attachment" "asg_attachment_tg" {
  autoscaling_group_name = aws_autoscaling_group.aws_asg.id
  alb_target_group_arn   = var.asg_tg_arn
}