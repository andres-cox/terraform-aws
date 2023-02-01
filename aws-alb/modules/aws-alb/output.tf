output "alb_listener_arn" {
  description = "ALB listener arn"
  value       = aws_lb_listener.acox_alb_listener.arn
}

output "alb_dns" {
  description = "DNS name of ALB"
  value       = aws_lb.acox_alb.dns_name
}