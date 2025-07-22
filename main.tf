provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "test_instance" {
    ami = "ami-719836928"
    instance_type = "t2.micro"
}

resource "aws_s3_bucket" "test_bucket" {
    bucket = "my-test-bucket.xyz"
}