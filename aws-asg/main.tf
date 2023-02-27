module "acox_network" {
  source = "./modules/aws-network"
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

module "acox_tg" {
  source = "./modules/aws-tg"
  listener_arn = module.acox_alb.alb_listener_arn
  vpc_id       = module.acox_network.vpc_id
  tg_name      = "acox-tg-a"
  condition = "/"
}


module "acox_asg" {
  source = "./modules/aws-asg"
  asg_subnets = [
    module.acox_network.subnet_a_id,
    module.acox_network.subnet_b_id
  ]
  vpc_security_group_ids = [module.acox_network.ec2_sg_id]
  asg_tg_arn = module.acox_tg.tg_arn
}
