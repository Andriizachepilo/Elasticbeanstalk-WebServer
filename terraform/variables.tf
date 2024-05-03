variable "dns_support" {
  type = bool
}

variable "public_cidr_block" {
  type = list(string)
}

variable "availability_zone" {
  type = list(string)
}

variable "private_cidr_block" {
  type = list(string)
}

variable "cidr_block" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "force_destroy" {
  type = bool
}

variable "create_elasticbeanstalk" {
  type = bool
}

variable "tier" {
  type = string
}


variable "availability_zones_selector" {
  type = string
}



variable "loadbalancer_type" {
  type = string
}


variable "s3_key" {
  type = string
}

variable "path_to_upload" {
  type = string
}

variable "beanstalk_app_name" {
  type = string
}


variable "associate_public_address" {
  type = bool
}



variable "lb_scheme" {
  type = string
}



variable "application_port" {
  type = number
}

variable "lb_protocol" {
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


variable "solution_stack_name" {
  type = string
}



variable "version_label" {
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


variable "env_name" {
  type = string
}


variable "region" {
  type = string
}

variable "StickinessEnabled" {
  type = bool
}

variable "proxy" {
  type = string
  default = "nginx"
}

variable "lb_ssl_policy" {
  type = string
}

variable "lb_certificate_arn" {
  type = string
}