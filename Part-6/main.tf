provider "aws" {
  region = "us-west-1"
}

variable "ami" {
    description = "value for the AMI to use for the instance"
}

variable "instance" {
    description = "value for the type of instance to create"
}

module "ec2_instance" {
  source        = "./ec2_instance/module"
  ami           = var.ami
  instance_type = var.instance
  # ami and instance_type is optional and can be overridden by ec2.tfvars
}