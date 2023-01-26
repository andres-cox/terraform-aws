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