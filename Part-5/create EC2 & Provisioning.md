## About this file 
in this project I create an EC2 for provisioning that means I make EC2 to deploy our simple app which I have made using Python I make an explanation of what I've done 

in the first line I put aws as my provider 
```bash
provider "aws" {
    region = "us-west-1"
}
```

when you create aws vpc through the UI you have to define ``CIDR block`` (how much range IP you want to use) this cidr for the entire vpc
```bash
variable "cidr" {
    default = "10.0.0.0/16"
}
```

``key_name`` name of your key pair
``public_key`` path to your public key
```bash
resource "aws_key_pair" "my_key_pair" {
    key_name   = "my_key"  # name of your key pair
    public_key = file("~/.ssh/id_rsa.pub")
    description = "My Key pair for python app"
}
```

This come from the previous CIDR that i've already provided
```bash
resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr
}
```

This ``cidr_block`` just for the subnet
```bash
resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"    # this cidr block is used for the subnet
  availability_zone = "us-west-1a"  # availability zone for the subnet
  map_public_ip_on_launch = true  # this will assign a public IP to the instances in this subnet
} 
```

if you create subnet above it will not be public subnet, that why I create this internet gate way
```bash
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}
```
afterwards I have to attach the igw with the Route table bellow as your destination
```bash
resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.my_vpc.id
    
```
The destination what I mean
```bash
resource "aws_route_table" "RT1" {
    vpc_id = aws_vpc.my_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
 }
}
```
Then I need to associate ``Route_table`` with the ``Subnet``
```bash
resource "aws_route_table_association" "rta1" {
    subnet_id      = aws_subnet.sub1.id
    route_table_id = aws_route_table.RT1.id
}
```

And finnaly I want to expose this particular Instance on the IP public address that why i'm providing security group
```bash
resource "aws_security_group" "web_sg" {
    name        = "web_sg"
    vpc_id      = aws_vpc.my_vpc.id
}
```

- In terraform Inbound configuration is represented using **``ingress``**  And outbound represented using **``egress``**

In ``ingress`` i'm saying open the port 80 for inbound traffic
```bash
    ingress {
        description = "HTTP from vpc"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        # allow HTTP from anywhere
    }
```

- I provide SSH if there's something wrong in the instance i'll fix it 
```bash
    ingress {
        description = "For SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        # allow SSH from anywhere
    }
```

- you can provide egress if the instace want to access anything from the outside
```bash
    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"  # -1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
```

And finally this is the instance configuration where I'm providing ami, instance_type, key_name, vpc_security, and subnet_id
```bash
resource "aws_ec2_instance" "server" {
  ami = "ami-0c55b159cbfafe1f0"  # replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = aws_subnet.sub1.id
}
```