resource "aws_instance" "acox_instance_1" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_1
  vpc_security_group_ids = [aws_security_group.acox_ec2_sg.id]
  subnet_id              = aws_default_subnet.subnet_ec2_1.id
  user_data              = data.template_file.efs_mount.rendered
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
  user_data              = data.template_file.efs_mount.rendered
  tags = {
    Name = var.instance_name_2
  }
  key_name = var.aws_key_name
}

data "template_file" "efs_mount" {
  template = file("efs-mount.sh")
  vars = {
    efs_id = aws_efs_file_system.acox_efs.id
  }
}
