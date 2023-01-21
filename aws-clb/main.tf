module "acox_instance_1" {
  source = "./modules/aws-ec2"

  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_1.id

  tags = {
    Name = var.instance_name_1
  }
}

module "acox_instance_2" {
  source = "./modules/aws-ec2"

  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_1.id

  tags = {
    Name = var.instance_name_2
  }
}

module "acox_instance_3" {
  source = "./modules/aws-ec2"

  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_1.id

  tags = {
    Name = var.instance_name_3
  }
}
