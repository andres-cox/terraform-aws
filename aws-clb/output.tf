output "instance_1_public_ip" {
  description = "Public IP address of EC2 instance 1"
  value       = aws_instance.acox_instance_1.public_ip
}
