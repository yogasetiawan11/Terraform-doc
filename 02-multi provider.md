# Multi provider
In terraform you can use multi Provider in a single project.
### Examlple
1. Create a file in the root directory of your terraform project.
2. In the file you spesify 2 Provider you will choose

```bash
provider "aws" {               
  region = "us-east-1"   
}
# AWS provider


resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}
# azurerm provider
```
3. In another Terraform configuration files, you can then use the aws and azurerm providers to create resources in AWS and Azure.

```bash
resource "aws_instance" "web" {            
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t3.micro"


resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.example.location
  vm_size               = "Standard_DS1_v2"
```