variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
}

variable "skip_final_snapshot" {
  type = bool
}

variable "db_subnet_group_name" {
  type = string
}

variable "db_port" {
  type = number
}

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


# variable "ingress_traffic" {
#   type = any
# }

# variable "egress_traffic" {
#   type = any
# }


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



variable "instance_class" {
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





################################################################
variable "associate_public_address" {
  type = bool
}



variable "lb_scheme" {
  type = string
}

variable "listener_enabled" {
  type = bool
}


variable "port" {
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


