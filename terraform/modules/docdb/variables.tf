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

variable "docdb_sg" {
  type = list(string) // ???????????????
}

variable "db_subnet_group_name" {
  type = string
}

variable "db_port" {
  type = number
}

variable "instance_class" {
  type = string
}

