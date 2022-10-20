resource "aws_subnet" "demo_private_subnet" {
  vpc_id        = "vpc-02e3c55b9764b76fc"
  availability_zone = "eu-central-1a"
   cidr_block = "172.31.128.0/19"
  tags = {
    Name = "${var.Access_Pri}-demo-subnet"
    Access = var.Access_Pri
  }
}
