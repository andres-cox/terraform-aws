output "instance_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = aws_instance.acox_instance.public_ip
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.acox_instance.id
}