resource "aws_vpc" "chandu-iot" {

  cidr_block       = "10.0.0.0/16"

  instance_tenancy = "default"



  tags = {

    Name = "chandu-iot"
  }
  }
  resource "aws_subnet" "main" {

  vpc_id     = aws_vpc.chandu-iot.id

  cidr_block = "10.0.1.0/24"



  tags = {

    Name = "Main"

  }

depends_on = [
  aws_vpc.chandu-iot
]
}

resource "aws_subnet" "iot" {

  vpc_id =aws_vpc.chandu-iot.id

  cidr_block = "10.0.2.0/24"



  tags = {

    Name = "Main"

  }
depends_on = [
  aws_vpc.chandu-iot
]
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.chandu-iot.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }

depends_on = [
  aws_vpc.chandu-iot
]

}


