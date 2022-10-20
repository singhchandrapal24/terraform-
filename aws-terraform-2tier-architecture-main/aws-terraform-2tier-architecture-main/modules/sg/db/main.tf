resource "aws_security_group" "demo-db-ec2-sg" {
  name        = "demo-db-ec2-sg"
  vpc_id      = "vpc-02e3c55b9764b76fc"

  ##### traffic must be allowed from web server  not from outside
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.app_security_group]
    description = "allowed ssh "
  }
  ingress {
    from_port   = 27017
    to_port     =27017
    protocol    = "tcp"
    security_groups = [var.app_security_group]
    description = "allowed web inbound traffic"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    security_groups = [var.app_security_group]
    description = "allowed icmp traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
