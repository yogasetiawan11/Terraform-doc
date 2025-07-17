# Variable
Variable in Terraform just like variable in any other language
A Variable is a named placeholder for a value that you want to be able to change or reuse throughout your code. typically there are 2 type Variable in Terraform.

## Input Variable
Variable are used to parameterize your terraform configurations. they allow you to pass value into your module or configuration from the outside Input variables can be defined within a module or at the root level of your configuration. instead of you hardcoding a module manually like (ami, instance_type) you can replace this with variable.
## Example
Example of Hardcoding
```bash
provider "aws" {                           
  region = "us-east-1"   
}
resource "aws_instance" "web" {            
  ami           = data.aws_ami.ubuntu.id  #
  instance_type = "t3.micro"
}
```

## here's how you define Input variable
```bash
variable "example_var" {
  description = "A human readable description."
  type        = string # Or number, bool, list, map, object, set, tuple
  default     = "t3.micro" # Optional: A fallback value if none is provided
  sensitive   = true # Optional: Mark as sensitive if it contains private info (e.g., passwords)
}
}
```
Explanation in this module
- ``variable`` "variable_name": This is how you declare a variable. variable_name is the name you'll use to reference this variable in your configuration. Choose something descriptive!

- ``description`` (optional but highly recommended!): This is a human-readable explanation of what the variable is for. It's super helpful for others (and your future self!) to understand the purpose of each variable.

- ``type`` (optional but highly recommended!): This specifies the data type of the variable's value. Terraform supports several primitive and complex types

then use input variable within your module or configuration like this:
```bash
resource "instance_type" "exampl_name" {
  instance_type = var.instance_type_value
}
```
You reference the input variable using ``var.instance_type_value``

## Output variable
```bash
output "example_output" {
  description = "An example output variable"
  value       = resource.example_resource.example.id
}
```
in this example
- ``output`` is used to declare variable name ``example_output``
- ``description`` is used to describe purpose of the code
- ``value`` spesify value that you want to expose as an output variable