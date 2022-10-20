provider "aws" {
      profile    = "default"
  region     = "us-east-1"
  access_key = "AKIAT2QSSNHQT3KNT6TU"
  secret_key = "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"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}