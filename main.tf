provider "aws" {
    region = "us-west-1"
}

variable "cidr" {
    default = "10.0.0.0/16"
}   # this cidr block is used for the VPC

resource "aws_key_pair" "my_key_pair" {
    key_name   = "my_key"  # name of your key pair
    public_key = file("~/.ssh/id_rsa.pub") # path to your public key
    description = "My Key pair for python app"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr
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

resource "aws_route_table" "RT1" {
    vpc_id = aws_vpc.my_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
 }
}

resource "aws_route_table_association" "rta1" {
    subnet_id      = aws_subnet.sub1.id
    route_table_id = aws_route_table.RT1.id
}

resource "aws_security_group" "web_sg" {
    name        = "web_sg"
    vpc_id      = aws_vpc.my_vpc.id
}
    ingress {
        description = "HTTP from vpc"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        # allow HTTP from anywhere
    }

    ingress {
        description = "For SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        # allow SSH from anywhere
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"  # -1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }

resource "aws_ec2_instance" "server" {
  ami = "ami-0c55b159cbfafe1f0"  # replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = aws_subnet.sub1.id
}
# in this step we are creating an EC2 instance with the specified AMI, instance type, key pair, security group, and subnet.