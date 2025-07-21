# Overview
In Directory you create a configuration file which contain your Terraform code ``(.tf)`` inside the file there's a code such as:

```bash
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}
```

# Initialization
after you finish with your Terraform code then run this command in your terminal
```bash
terraform init
```
this command will initialize your Terraform working directory, downloading any necessary provider plugin

# Terraform Apply
The ``terraform plan`` command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure. 

# Apply the configuration
run this command to create AWS resource defined in Terraform configuration
```bash
terraform apply
```
terraform will display a plan of the changes it's going to make, review and type ``yes`` to apply it

if you want to remove the resources created by terraform, you can followed this command:
```bash
terraform destroy
```
Be cautious when use this command. it will delete resources as spesified in terraform configuration