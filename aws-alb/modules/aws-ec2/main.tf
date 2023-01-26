resource "aws_instance" "acox_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  # availability_zone      = var.availability_zone
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/startup.sh")
  key_name               = var.aws_key_name
  tags                   = var.tags
  monitoring             = true

  ## below are suggested by 'checkov' but terraform cannot deploy it
  # might not be viable in t2.micro

  # ebs_optimized          = true

  # root_block_device {
  #   encrypted = true
  # }

  # metadata_options {
  #   http_endpoint = "disabled"
  #   http_tokens   = "optional"
  # }
}
