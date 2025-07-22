## What is terraform state file 
Terraform state file is crucial thing in terraform it will allow you to keep track of your your resources, this file often named ``terraform.tfstate``, this is a json or HCL Formatted that contains important information about infrastructure's current state such as resource atributes, dependencies, meta data.

Before you execute terraform using ``terraform apply`` or ``terraform plan`` terraform checks file state to determine the current state of the infrastructure. 

### Advantage of terraform state file
1. **Resource Tracking**: The Terraform state file keeps track of the current state of your infrastructure. ``When you run terraform plan``, Terraform compares the state file with your configuration code and the real infrastructure to show what changes will occur. This ensures accurate updates, deletions, and resource management without creating duplicates or destroying the wrong resources.

2. **Concurrency Control**: Terraform uses the state file to lock resources, preventing multiple users or processes from modifying the same resource simultaneously. This helps avoid conflicts and ensures data consistency

3. **Meta Data**: Alongside the mappings between resources and remote objects, Terraform must also track metadata such as resource dependencies

4. **Calculation**: Terraform uses the state file to calculate and display the difference between the desired configuration and the current state file

### Disadvantage of state file
1. **Security Risk**: when Using state file your sensitive information such as API, Password may be stored in state file if it's commited to VCS because organization using VCS are often sharing among member in organization. 
2. **Complexity**: Managing state file in VCS can be lead complex versioning issues, especially when multiple team or member working on the same infrastructure

## Solve the advatages with remote backend (e.g S3)
a Remote backend store state file outside local file system or Version control system. using s3 bucket it's a popular choice due to its scalability and reliablity you can store the state file here's how to set up:

- Create an s3 bucket: Creat s3 bucket to store your state file.
- Configure remote backend in terraform
```bash
terraform {
  backend "s3" {
    bucket = "mybucket"   # enter your name bucket s3
    key    = "path/to/my/key"   
    region = "us-east-1"   
  }
}

```
## Dynamodb for state looking
State locking in Terraform is a mechanism that prevents simultaneous modifications to your infrastructure by locking the state file during operations like terraform plan or terraform apply

to provide state locking, create DynamoDB table and provide its name ``dynamodb_table`` this prevent concurrent access issues when multiple users or process run Terraform.