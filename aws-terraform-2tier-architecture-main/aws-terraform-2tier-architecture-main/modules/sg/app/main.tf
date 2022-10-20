resource "aws_security_group" "demo-app-ec2-sg" {
  name        = "demo-app-ec2-sg"
  vpc_id      = "vpc-02e3c55b9764b76fc"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allowed ssh "
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allowed http traffic"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Demo-app-Ec2-Sg"
    Environment = var.Environment
  }
}
