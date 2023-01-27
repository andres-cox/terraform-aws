module "acox_instances_region_a" {
  source = "./modules/aws-ec2"

  for_each = var.ec2_instances_a

  # availability_zone      = each.value.availability_zone
  subnet_id              = aws_subnet.subnet_a.id
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]

  tags = {
    Name = each.value.name
  }
}

module "acox_instances_region_b" {
  source = "./modules/aws-ec2"

  for_each = var.ec2_instances_b

  # availability_zone      = each.value.availability_zone
  subnet_id              = aws_subnet.subnet_b.id
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]

  tags = {
    Name = each.value.name
  }
}

module "acox_tg_1" {
  source = "./modules/aws-tg"

  for_each     = module.acox_instances_region_a
  listener_arn = aws_lb_listener.acox_alb_listener.arn

  vpc_id    = aws_vpc.main.id
  tg_name   = "acox-tg-a"
  target_id = each.value.instance_id
  # load_balancer_arn = aws_lb.acox_alb.arn
  condition = "/tg1"

}

module "acox_tg_2" {
  source = "./modules/aws-tg"

  for_each     = module.acox_instances_region_b
  listener_arn = aws_lb_listener.acox_alb_listener.arn
  vpc_id       = aws_vpc.main.id
  tg_name      = "acox-tg-b"
  target_id    = each.value.instance_id
  # load_balancer_arn = aws_lb.acox_alb.arn
  condition = "/tg2"

}
