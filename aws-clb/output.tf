output "clb_dns" {
  description = "ELB (classic load balancer) DNS name"
  value       = aws_elb.acox_clb.dns_name
}
