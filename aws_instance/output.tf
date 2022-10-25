output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.instance_example.public_ip
}

output "security_group" {
  description = "Security group of instace"
  value       = aws_security_group.acox_sg.name
}