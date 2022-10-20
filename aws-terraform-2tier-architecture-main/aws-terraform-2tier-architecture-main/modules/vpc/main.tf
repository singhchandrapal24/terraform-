resource "aws_vpc" "aws_vpc" {

enable_dns_support   = true
enable_dns_hostnames = true
 cidr_block = "10.0.0.0/16"
    tags = {
        Name = "demo_vpc"
    }
}
