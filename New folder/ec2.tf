 resource "aws_instance" "ec2" {
  ami           = "${ami-052efd3df9dad4825}"
  instance_type = "${t2.micro}"
  key_name  = "${clikey}"
  subnet_id = "${subnet-01d1ec5d3186b5d3d}"
  vpc_security_group_ids = ["${sg-01dcf2c8d381105fe}"]

  tags = {
    Name = "${chandu}-ec2"
  }
 }
