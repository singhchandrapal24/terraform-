variable "cidr_block" {
  default = "0.0.0.0/0"
}
variable "enable_dns_support" {
 default = "true"
}
variable "enable_dns_hostnames" {
 default = "true"
}

variable "instance_tenancy" {
 default = "true"
}

variable "Name" {
 default = "demo_vpc"
}
