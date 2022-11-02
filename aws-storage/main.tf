resource "aws_instance" "acox_instance" {
  ami               = var.instance_ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  tags = {
    Name = var.instance_name
  }
  security_groups = ["${aws_security_group.acox_sg.name}"]
  key_name        = var.aws_key_name
  user_data       = file("ebs-mount.sh")

}

resource "null_resource" "data_config" {
  depends_on = ["aws_volume_attachment.ebs_attachment", "aws_instance.acox_instance"]

  triggers = {
    instance_ip = aws_instance.acox_instance.public_ip
  }

  ## run unmount commands when destroying the data volume
  provisioner "remote-exec" {
    when = destroy
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("../acox-key.pem")
      host        = self.triggers.instance_ip
    }
    inline = ["sudo umount /data"]
  }
}

resource "aws_ebs_volume" "acox_ebs" {
  availability_zone = var.availability_zone
  size              = 2

  tags = {
    Name = "acox"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.acox_ebs.id
  instance_id = aws_instance.acox_instance.id
}

resource "aws_security_group" "acox_sg" {
  name        = "acox-ssh-http"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "SSH connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-ssh-http"
  }
}