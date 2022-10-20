provider "aws" {
  region  = "us-east-2"
  profile = "default"
}
#####ec2 full work#####
module "ec2fullwork" { 
  source = "../ec2 full work"
  ami =  var.ami
  ssh_key = "chandu-1" # key is already created
  volume_type = "gp2"
  volume_size = "30"
  instance_type = "t2.micro"
  vpc_id = path.module
}
##### api gate way#####
module "apigateway" {
  source = "../api gateway"

}

#####database#####
module "database" {
source = "../database"

}
##### lamda functions#####
module "lamdafunctions" {
  source = "../lamda functions"
    
}

##### s3 #####
module "s3" {
  source = "../s3"
  
}

##### sqs #####
module "sqs" {
  source = "../sqs"
  
}

##### sns#####
module "sns" {
  source = "../sns"
  
}
##### cloud watch#####
module "cloudwatch" {
  source = "../cloud watch"
  
}
##### depends on #####
module "dependson" {
  source = "../depends on"
  
}