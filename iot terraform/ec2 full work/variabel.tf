variable "ami" {
  default = "ami-0f924dc71d44d23e2"
}

variable "vpc_id" {
  default = "vpc-0994af1a18564517e"
}

variable "subnet_id" {
  default = "subnet-04cf529db6e1aa982"
}

variable "vpc_security_group_ids" {
  default = "sg-04a6b1ce012175e53"
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



variable "instance_profile" {
  default = ""
}

variable "key_name" {
  default = "chandu-2"
}

variable "associate_public_ip_address" {
  default = ""
}


variable "volume_type" {
  default = ""
}