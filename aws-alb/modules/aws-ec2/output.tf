output "instance_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.acox_instance.public_ip
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.acox_instance.id
}

# output "subnet_id" {
#   description = "Subnet id of instance"
#   value       = aws_default_subnet.subnet_ec2.id
# }