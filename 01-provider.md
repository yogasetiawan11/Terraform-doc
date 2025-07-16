# Provider
Provider is a plugin that helps Terraform to understand where it has to create Infrastructure. 
For example if you want to use Terraform to create some services in AWS so you would like to use AWS as your Provider.
Provider is a set of resources that terraform used to create, apply, and destroy Virtual Machine on AWS.
imagine It acts as a bridge between your `terraform` code and Public cloud provider.

# Example
```bash
provider "aws" {                           # set the provider that you are usng
  region = "us-east-1"   
}
resource "aws_instance" "web" {            # define a resource and give it a name whatever you want
  ami           = data.aws_ami.ubuntu.id   # specify the AMI ID for the instance
  instance_type = "t3.micro"
}
```
in this example we use AWS as our Provider, ``spesifying region``, and ``spesifying resource``
When terraform runs first it will install AWS provider then it will use AWS Provider to create VM

Here some example provider that commonly use:
- azurerm - for azure
- google - for google
- kubernetes - for kubernetes
- openstack - for openstack

Providers are essential to determine what kind of Cloud provider that will choose this can make terraform versatile to manage different infrastucture.
