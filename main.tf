provider "aws" {
    region = "us-west-1"
}

resource "cidr" {
    default = "10.0.0.0/16"
}   # this cidr block is used for the VPC

resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr
}

resource "aws_key_pair" "my_key_pair" {
    description = "My Key pair for python app"
    key_name   = "my_key"  # name of your key pair
    public_key = file("~/.ssh/id_rsa.pub") # path to your public key
}

resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"    # this cidr block is used for the subnet
  availability_zone = "us-west-1a"  # availability zone for the subnet
  map_public_ip_on_launch = true  # this will assign a public IP to the instances in this subnet
} 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = ""
 }
}
