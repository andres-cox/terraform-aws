resource "aws_instance" "acox_instance_1" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_1
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_1.id
  user_data              = file("startup.sh")
  key_name               = var.aws_key_name

  tags = {
    Name = var.instance_name_1
  }
}
