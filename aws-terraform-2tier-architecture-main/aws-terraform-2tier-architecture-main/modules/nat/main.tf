resource "aws_nat_gateway" "demo_nat" {

  allocation_id = var.allocation_id
  subnet_id     = "subnet-01a5c1655fc3bc9ab"

  tags = {
    Name = "demo-nat"
  }

}
