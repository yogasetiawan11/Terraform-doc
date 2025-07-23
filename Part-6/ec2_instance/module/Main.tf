provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "yoga_setiawan" {
  ami = "var.ami"
  instance_type = "var.instance_type"
}