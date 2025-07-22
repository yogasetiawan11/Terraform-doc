## What is terraform state file 
Terraform state file is crucial thing in terraform it will allow you to keep track of your your resources, this file often named ``terraform.tfstate``, this is a json or HCL Formatted that contains important information about infrastructure's current state such as resource atributes, dependencies, meta data.

Before you execute terraform using ``terraform apply`` or ``terraform plan`` terraform checks file state to determine the current state of the infrastructure. 

### Advantage of terraform state file
1. **Resource Tracking**: The Terraform state file keeps track of the current state of your infrastructure. ``When you run terraform plan``, Terraform compares the state file with your configuration code and the real infrastructure to show what changes will occur. This ensures accurate updates, deletions, and resource management without creating duplicates or destroying the wrong resources.

2. **Concurrency Control**: Terraform uses the state file to lock resources, preventing multiple users or processes from modifying the same resource simultaneously. This helps avoid conflicts and ensures data consistency

3. **Meta Data**: Alongside the mappings between resources and remote objects, Terraform must also track metadata such as resource dependencies

4. ****

### Disadvantage of state file
1. **Security Risk**: 
2. ****:

### Solve the advatages with remote backend (e.g S3)
1. Create an s3 bucket: Creat s3 bucket to store your state file.
2. Configure remote backend in terraform
```bash
terraform {
  backend "s3" {
    bucket = "mybucket"   # enter your name bucket s3
    key    = "path/to/my/key"   
    region = "us-east-1"   
  }
}

```