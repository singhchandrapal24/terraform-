variable "ami" {
  default = "ami-0f924dc71d44d23e2"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-east-2"]
}
variable "tags" {
    default = "iotchandu"
  
}