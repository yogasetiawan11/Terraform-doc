provider = "aws" {
    region = "us-west-1"
}

resource "aws_ec2_instance" "First_module" {
    ami = "var.ami_value"
    Instance_type = "var.instance_type_value"
    subnet_id = "var.subnet_id_value"
}

