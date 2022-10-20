variable "ami" {
  default = "ami-00d5e377dd7fad75"
}

variable "vpc_id" {
  default = "vpc-023aecf79b996b54a"
}

variable "subnet_id" {
  default = "subnet-01a5c1655fc3bc9ab"
}

variable "vpc_security_group_ids" {
  default = "sg-08abf8349c87b66db"
}

variable "instance_type" {
  description = "t2.micro"
}


variable "Environment" {
  default = ""
}

variable "Accesstype" {
  default = ""
}


variable "ssh_key" {
  description = ""
}

variable "volume_size" {
  description = ""
}


variable "instance_profile" {
  default = ""
}

variable "key_name" {
  default = "demokey"
}

variable "associate_public_ip_address" {
  default = ""
}


variable "volume_type" {
  default = "t2.micro"
}
