variable "ec2_instances_a" {
  description = "Map of project names to configuration."
  type        = map(any)

  default = {
    acox_a_1 = {
      name = "acox-instance-a-1",
      # availability_zone = "us-east-1a"
    },
    acox_a_2 = {
      name = "acox-instance-a-2",
      # availability_zone = "us-east-1b"
    }
  }
}

variable "ec2_instances_b" {
  description = "Map of project names to configuration."
  type        = map(any)

  default = {
    acox_b_1 = {
      name = "acox-instance-b-1",
      # availability_zone = "us-east-1a"
    },
    acox_b_2 = {
      name = "acox-instance-b-2",
      # availability_zone = "us-east-1b"
    }
  }
}