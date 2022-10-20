resource "aws_instance" "dev" {

  ami           = "ami-0e2031728ef69a466"
  instance_type = "t3.micro"

  subnet_id                   = "subnet-01a5c1655fc3bc9ab"
  key_name                    = "demo-key"

  tags = {
      Name            = "demo-${var.Accesstype}-${var.Environment}"
      Environment     = "dev"
      Accesstype      = var.Accesstype
  }
}
