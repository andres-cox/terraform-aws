variable "ec2_instances_a" {
  description = "Map of project names to configuration."
  type        = map(any)

  default = {
    acox_a_1 = {
      name = "acox-instance-a-1",
    },
    acox_a_2 = {
      name = "acox-instance-a-2",
    }
  }
}

variable "ec2_instances_b" {
  description = "Map of project names to configuration."
  type        = map(any)

  default = {
    acox_b_1 = {
      name = "acox-instance-b-1",
    },
    acox_b_2 = {
      name = "acox-instance-b-2",
    }
  }
}