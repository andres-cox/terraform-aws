output "tg_arn" {
  description = "target group arn id"
  value       = aws_lb_target_group.acox_tg.arn
}