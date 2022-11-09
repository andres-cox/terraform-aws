resource "aws_efs_file_system" "acox_efs" {
  creation_token   = "my-product"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "acox-efs"
  }
}

resource "aws_efs_mount_target" "efs_target_1" {
  file_system_id = aws_efs_file_system.acox_efs.id
  subnet_id      = aws_default_subnet.subnet_ec2_1.id
  security_groups = [ aws_security_group.acox_efs_sg.id ]
}

resource "aws_efs_mount_target" "efs_target_2" {
  file_system_id = aws_efs_file_system.acox_efs.id
  subnet_id      = aws_default_subnet.subnet_ec2_2.id
  security_groups = [ aws_security_group.acox_efs_sg.id ]
}

resource "aws_security_group" "acox_efs_sg" {
  name        = "acox-efs"
  description = "Allow NFS traffic"
  vpc_id      = aws_default_vpc.vpc_default.id

  ingress {
    description     = "Allow EC2 instances into EFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.acox_ec2_sg.id]
  }

  tags = {
    Name = "allow-nfs"
  }
}
