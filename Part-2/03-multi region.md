# Multi Region
you can use ``alias`` keyword in you terraform to provide multiple region

# Example
```bash
provider "aws" {                       
  alias = "us-east-1"        # here you put the alias
  region = "us-east-1"   
}

provider "aws" {                       
  alias = "us-east-2"        # here you put the alias
  region = "us-east-2"   
}



resource "aws_instance" "web" {            
  provider = aws.us-east-1
  ami           = "ami-id4239423094"   
  instance_type = "t3.micro"
}

resource "aws_instance" "name" {
    provider = aws.us-east-2               
    ami           = "ami-id4239423094"    
    instance_type = "t3.micro"
}
```