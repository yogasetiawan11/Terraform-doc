terraform {
  backend "s3" {
    bucket = "test_bucket"
    key    = "yoga/terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "Terraform_Lock_Table"
  }
}

# the key specifies the path (including folders) and filename where Terraform will store the state file inside your S3 bucket.
# DynamoDB table used for state locking 