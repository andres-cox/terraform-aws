module "acox_instances" {
  source = "./modules/aws-ec2"

  for_each = var.ec2_instances

  availability_zone      = each.value.availability_zone
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]

  tags = {
    Name = each.value.name
  }
}
