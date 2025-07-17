# Define Input Variables for AWS Instance
variable "instance_type" {
  description = "The type of instance to use."
  type        = string
  default     = "t2.micro"
  
}

# Define Input Variables ami value
variable "ami_value" {
  description = "The AMI ID to use for the instance."
  type        = string
  
}

# Create an AWS Instance using Input variables above
resource "aws_instance" "practice" {
  ami           = var.ami_value
  instance_type = var.instance_type
  
}

# Output the public IP of the created instance
output "public_ip" {
  value = aws_instance.practice.public_ip
}
