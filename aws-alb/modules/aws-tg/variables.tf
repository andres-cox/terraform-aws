variable "vpc_id" {
  description = "vpc id for target group"
  type        = string
}

variable "target_id" {
  description = "instance ids for target group"
  type        = string
}

variable "tg_name" {
  description = "target group name"
  type        = string
}

# Listener Vars
# variable "load_balancer_arn" {
#   description = "load balancer arn to attach listener"
#   type        = string
# }

variable "condition" {
  description = "condition path pattern"
  type        = string
}

variable "listener_arn" {
  description = "listener arn id"
  type        = string
}