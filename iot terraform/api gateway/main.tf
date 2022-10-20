resource "aws_nat_gateway" "example" {
  allocation_id = "vpc-0994af1a18564517e"
  subnet_id     = "subnet-0f79e2e31bc0eeab8"

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
}
resource "aws_nat_gateway" "example1" {
  connectivity_type = "private"
  subnet_id         = "subnet-04cf529db6e1aa982"
}
