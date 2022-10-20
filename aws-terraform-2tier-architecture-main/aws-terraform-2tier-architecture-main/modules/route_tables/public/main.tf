resource "aws_route_table" "demo_public_route" {
  vpc_id = "vpc-02e3c55b9764b76fc"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "nat-0831a957dbfd4355f"
  }


  tags = {
    Name = "demo-public-route-table"
    Environment = var.Environment
  }
}

resource "aws_route_table_association" "demo_public_route_association"{
  depends_on = [
      aws_route_table.demo_public_route
  ]
    subnet_id = var.public_subnet_id
    route_table_id = "${aws_route_table.demo_public_route.id}"
}
