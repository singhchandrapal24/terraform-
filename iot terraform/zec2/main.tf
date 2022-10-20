resource "aws_instance" "example" {



  ami                    = "ami-0f924dc71d44d23e2"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["aws_vpc.chandu-iot.id"]
  subnet_id              ="aws_vpc.chandu-iot.id"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}