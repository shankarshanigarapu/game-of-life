

variable "instance_type" {
   description= "instance type to launch"
}
variable "key_name" {
  description="keyname to attach to the instances"
}
variable "availability_zones" {
  description="availability_zones for auto scaling group"
}

variable "name_prefix" {
description ="name of launch configuration"
}

variable "image_id" {
  description ="ami to attach autoscaling group"
}

variable "environment_tag" {
  description = "defining the environment"
  default= "DEV_EC2"
}
