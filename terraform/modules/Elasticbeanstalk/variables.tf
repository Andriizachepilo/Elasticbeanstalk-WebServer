variable "associate_public_address" {
  type = bool
}

variable "ec2_subnets" {
  type = list(string)
}

variable "lb_subnets" {
  type = list(string)
}
variable "asg_sg" {
  type = list(string)
}

variable "lb_scheme" {
  type = string
}

variable "loadbalancer_sg_80" {
  type = list(string)
}

variable "loadbalancer_sg_443" {
  type = list(string)
}

variable "application_port" {
  type = number
}

variable "lb_protocol" {
  type = string
}

variable "availability_zones_selector" {
  type = string
}

variable "autoscale_min" {
  type = number
}

variable "autoscale_max" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "keypair" {
  type = string
}

variable "environment_type" {
  type = string
}

variable "loadbalancer_type" {
  type = string
}
##########################

variable "beanstalk_app_name" {
  type = string
}

variable "solution_stack_name" {
  type = string
}

variable "tier" {
  type = string
}

variable "version_label" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "health_path" {
  type = string
}

variable "MeasureName" {
  type = string
  default = "CPUUtilization"
}

variable "RootSize" {
  type = number
}

variable "RootVolumeType" {
  type = string
}

variable "s3bucket_id" {
  type = string
}

variable "s3object_id" {
  type = string
}

variable "env_name" {
  type = string
}

variable "create_elasticbeanstalk" {
  type = bool
}

