provider "aws" {
    region = "us-west-1"
  
}

module "ec2_instance" {
    source = "./module/ec2_instance"    # Enter the path to your module here
    ami_value = "ami=719836928"
    instance_type_value = "t2.micro"
    subnet_id_value = "subnet-12345678"
  
}

#   you can delete the .rfvars 
#   because people who are excuting the module they will get the .tfvars