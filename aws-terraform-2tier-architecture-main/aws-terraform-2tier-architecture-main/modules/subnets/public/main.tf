resource "aws_subnet" "demo_public_subnet" {
  vpc_id        ="vpc-02e3c55b9764b76fc"
  availability_zone = "eu-central-1b"
   cidr_block = "172.31.64.0/19"
  tags = {
    Name = "${var.Access_Pub}-demo-subnet"
    Access = var.Access_Pub
  }
}
