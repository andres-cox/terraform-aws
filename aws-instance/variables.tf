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

variable "instance_name" {
  description = "Value of the Name Tag for the EC2 instance"
  type        = string
  default     = "instance"
}

variable "aws_security_groups" {
  description = "aws security groups"
  type        = list(string)
  default     = [ "acox-sg" ]
}

variable "aws_key_name" {
  description = "aws key for instances"
  type        = string
  default     = "acox-key"
}