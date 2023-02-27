variable "instance_ami" {
  description = "Amazon Linux 2 Kernel 5.10 AMI 2.0.20221004.0 x86_64 HVM gp2"
  type        = string
  default     = "ami-09d3b3274b6c5d4aa"
}

variable "instance_type" {
  description = "Value of the Instance Type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "aws_key_name" {
  description = "aws key for instances"
  type        = string
  default     = "acox-key"
}

variable "vpc_security_group_ids" {
  description = "vpc security group id"
  type        = list(string)
}

variable "asg_subnets" {
  description = "ALB security group id"
  type        = list(string)
}

variable "asg_tg_arn" {
  description = "tg arn for autoscaling group"
  type        = string
}