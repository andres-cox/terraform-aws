output "vpc_id" {
  description = "VPC id"
  value       = aws_vpc.main.id
}

output "subnet_a_id" {
  description = "vpc subnet-a id"
  value       = aws_subnet.subnet_a.id
}

output "subnet_b_id" {
  description = "vpc subnet-b id"
  value       = aws_subnet.subnet_b.id
}

output "ec2_sg_id" {
  description = "ec2 instance security group"
  value       = aws_security_group.acox_ec2_sg.id
}

output "alb_sg_id" {
  description = "alb instance security group"
  value       = aws_security_group.acox_alb_sg.id
}