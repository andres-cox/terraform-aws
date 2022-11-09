resource "aws_instance" "acox_instance_1" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_1
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_1.id
  user_data              = file("efs-mount.sh")
  tags = {
    Name = var.instance_name_1
  }
  key_name = var.aws_key_name

}

resource "aws_instance" "acox_instance_2" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_2
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_2.id
  user_data              = file("efs-mount.sh")
  
  tags = {
    Name = var.instance_name_2
  }
  key_name = var.aws_key_name

}
