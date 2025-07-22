provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "test_instance" {
    ami = "ami-719836928"
    instance_type = "t2.micro"
}

resource "aws_s3_bucket" "test_bucket" {
    bucket = "my-test-bucket.xyz"  #the bucket name has to be unique
}

resource "aws_dynamodb_table" "Terraform_Lock_Table" {
  name             = "terraform_lock"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"

attribute {
    name = "Hold_ID"
    type = "S"
  }
}
