module "acox_network" {
  source = "./modules/aws-network"
}

module "acox_instances_region_a" {
  source = "./modules/aws-ec2"

  for_each = var.ec2_instances_a

  subnet_id              = module.acox_network.subnet_a_id
  vpc_security_group_ids = [module.acox_network.ec2_sg_id]

  tags = {
    Name = each.value.name
  }
}

module "acox_instances_region_b" {
  source = "./modules/aws-ec2"

  for_each = var.ec2_instances_b

  subnet_id              = module.acox_network.subnet_b_id
  vpc_security_group_ids = [module.acox_network.ec2_sg_id]

  tags = {
    Name = each.value.name
  }
}

module "acox_alb" {
  source = "./modules/aws-alb"
  alb_sg_ids = [
    module.acox_network.alb_sg_id
  ]
  alb_subnets = [
    module.acox_network.subnet_a_id,
    module.acox_network.subnet_b_id
  ]
}

module "acox_tg_1" {
  source = "./modules/aws-tg"

  for_each     = module.acox_instances_region_a
  
  listener_arn = module.acox_alb.alb_listener_arn
  vpc_id    = module.acox_network.vpc_id
  tg_name   = "acox-tg-a"
  target_id = each.value.instance_id
  condition = "/tg1"
}

module "acox_tg_2" {
  source = "./modules/aws-tg"

  for_each     = module.acox_instances_region_b
  
  listener_arn = module.acox_alb.alb_listener_arn
  vpc_id       = module.acox_network.vpc_id
  tg_name      = "acox-tg-b"
  target_id    = each.value.instance_id
  condition    = "/tg2"
}
