variable "ami" {
    description = "The AMI to use for the instance"
    type        = string
    default     = "ami-12345678"  # Default value can be overridden by ec2.tfvars
}

variable "instance_type" {
    description = "The type of instance to create"
    type        = string
    default     = "t2.micro"  # Default value can be overridden if needed
  
}