variable "aws_security_groups" {
  description = "aws security groups"
  type        = list(string)
  default     = ["acox-sg"]
}

variable "availability_zone_1" {
  description = "availability zone instance 1"
  type        = string
  default     = "us-east-1a"
}

variable "instance_name_1" {
  description = "Value of the Name Tag for the EC2 instance"
  type        = string
  default     = "acox-instance-1"
}

variable "instance_name_2" {
  description = "Value of the Name Tag for the EC2 instance"
  type        = string
  default     = "acox-instance-2"
}

variable "instance_name_3" {
  description = "Value of the Name Tag for the EC2 instance"
  type        = string
  default     = "acox-instance-3"
}