variable "ec2_instances" {
  description = "Map of project names to configuration."
  type        = map(any)

  default = {
    acox_1 = {
      name              = "acox-instance-1",
      availability_zone = "us-east-1a"
    },
    acox_2 = {
      name              = "acox-instance-2",
      availability_zone = "us-east-1b"
    },
    acox_3 = {
      name              = "acox-instance-3",
      availability_zone = "us-east-1c"
    },
  }
}