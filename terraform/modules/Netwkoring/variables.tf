variable "cidr_block" {
  type = string
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

variable "db_subnet_group_name" {
  type = string
}