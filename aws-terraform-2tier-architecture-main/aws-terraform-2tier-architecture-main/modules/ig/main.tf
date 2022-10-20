resource "aws_internet_gateway" "demo_ig" {
  vpc_id = "vpc-02e3c55b9764b76fc"

  tags = {
    Name = "demo-ig"
  }
}
