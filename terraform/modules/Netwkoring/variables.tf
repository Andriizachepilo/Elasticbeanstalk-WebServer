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

variable "associate_public_address" {
  type = bool
}