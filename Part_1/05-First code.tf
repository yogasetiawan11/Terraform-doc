provider "aws" {                           # set the provider that you are usng
  region = "us-east-1"   
}
resource "aws_instance" "web" {            # define a resource and give it a name whatever you want
  ami           = data.aws_ami.ubuntu.id   # specify the AMI ID for the instance
  instance_type = "t3.micro"
}