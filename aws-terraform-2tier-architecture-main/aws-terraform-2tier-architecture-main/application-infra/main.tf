provider "aws" {
  region  = "eu-central-1"
  profile = "default"
  access_key = ""
  secret_key = ""
}


########### VPC #############
module "demo-vpc" {
  source               = "../modules/vpc"
  cidr_block           = "0.0.0.0/0"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
}

############### Internet Gateway ##############
module "demo-ig" {
  depends_on = [
    module.demo-vpc
  ]
  source = "../modules/ig"
  vpc_id = module.demo-vpc.vpc_id
}

################## Subnet Private and Public #############
module "demo-private-subnet" {
  depends_on = [
    module.demo-vpc
  ]
  source            = "../modules/subnets/private"
  vpc_id            = module.demo-vpc.vpc_id
  cidr_block        = "10.12.1.0/24"
  availability_zone = "eu-central-1a"
  Access_Pri        = "private"
}

module "demo-public-subnet" {
  depends_on = [
    module.demo-vpc
  ]
  source            = "../modules/subnets/public"
  vpc_id            = module.demo-vpc.vpc_id
  cidr_block        = "10.12.2.0/24"
  availability_zone = "eu-central-1a"
  Access_Pub        = "public"
}

#################### NAT Gateway #################
module "demo-nat" {
  depends_on = [
    module.demo-vpc,
    module.demo-ig,
    module.demo-public-subnet
  ]
  source        = "../modules/nat"
  allocation_id = "eipalloc-0e281737277a38afd"
  subnet_id     = module.demo-public-subnet.public_subnet_id
}

################### Routing Tables Public and Private ################

module "demo-public-route-table" {
  depends_on = [
    module.demo-vpc,
    module.demo-public-subnet
  ]
  source           = "../modules/route_tables/public"
  gateway_id       = module.demo-ig.gateway_id
  vpc_id           = module.demo-vpc.vpc_id
  public_subnet_id = module.demo-public-subnet.public_subnet_id
  Environment      = "public"
}

module "demo-private-route-table" {
  depends_on = [
    module.demo-vpc,
    module.demo-private-subnet,
    module.demo-nat.nat_id
  ]
  source            = "../modules/route_tables/private"
  nat_id            = module.demo-nat.nat_id
  vpc_id            = module.demo-vpc.vpc_id
  private_subnet_id = module.demo-private-subnet.private_subnet_id
  Environment       = "private"
}

############### Web Server Sg and Ec2 instance ####################

module "demo-app-ec2-sg" {
  depends_on = [
    module.demo-vpc
  ]
  source       = "../modules/sg/app"
  vpc_id       = module.demo-vpc.vpc_id
  local_server = "172.30.112.112/32"
  Environment  = "demo-env"
}


module "app_ec2" {
  depends_on = [
    module.demo-vpc,
    module.demo-public-subnet,
    module.demo-private-subnet,
    module.demo-private-route-table,
    module.demo-public-route-table,
    module.demo-app-ec2-sg
  ]
  source                      = "../modules/ec2"
  vpc_id                      = module.demo-vpc.vpc_id
  subnet_id                   = module.demo-public-subnet.public_subnet_id
  ami                         = "ami-0e2031728ef69a466"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  ssh_key                     = "demo-key"
  vpc_security_group_ids      = module.demo-app-ec2-sg.app_sg_id
  volume_type                 = "gp2"
  volume_size                 = "30"
  Accesstype                  = "web-server"
  Environment                 = "dev"
}

############### DB Sg and Ec2 instance ####################

module "demo-db-ec2-sg" {
  depends_on = [
    module.demo-vpc,
    module.demo-app-ec2-sg
  ]
  source       = "../modules/sg/db"
  vpc_id       = module.demo-vpc.vpc_id
  app_security_group = module.demo-app-ec2-sg.app_sg_id
  Environment  = "demo-env"
}

module "db_ec2" {
  depends_on = [
    module.demo-vpc,
    module.demo-public-subnet,
    module.demo-private-subnet,
    module.demo-private-route-table,
    module.demo-public-route-table,
    module.demo-app-ec2-sg,
    module.demo-db-ec2-sg
  ]
  source                      = "../modules/ec2"
  vpc_id                      = module.demo-vpc.vpc_id
  subnet_id                   = module.demo-private-subnet.private_subnet_id
  ami                         = "ami-00d5e377dd7fad751" # aws ami used
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  ssh_key                     = "demo-key" # key is already created
  vpc_security_group_ids      = module.demo-db-ec2-sg.db_sg_id
  volume_type                 = "gp2"
  volume_size                 = "30"
  Accesstype                  = "db-server"
  Environment                 = "dev"
}
