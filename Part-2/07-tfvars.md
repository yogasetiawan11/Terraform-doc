# What is ``.tfvars``
In Terraform, ``.tfvars`` is a plain text file that defines the values for the input variables that declared in your Terraform configuration.

it allows you to seperate configuration value from your Terraform code making easily manage. so when there're someone who wanna edit Terraform they can make the change in ``.tfvars``

Structure folder and file when using ``.tfvars``.
```bash
main-folder.tf           #You can provide the name depending your need
     |---> Provider.tf   #Create Provider that you are using
     |---> Input.tf      #inside the input file you will create variable value
     |---> Output.tf      
     terraform.tfvars
```
the Provide configuration from ``main-folder.tf``

# Why are .tfvars files important?
``Separation of configuration of code``: It can separates your infrastructure definition (the ``.tf`` files with resource and variable blocks) from your infrastructure values (the specific data you want to use for those variables).

``Reusability``: Instead of hardcoding values directly into your ``.tf`` files, you use variables. Then, ``.tfvars`` files allow you to easily change these values for different environments, projects, or use cases without modifying the core Terraform code.

``Example``: You might have a file ``main.tf`` that defines an EC2 instance. The instance type could be a variable ``(instance_type)``. You can then have ``dev.tfvars`` with instance_type = "t2.micro" and ``prod.tfvars`` with instance_type = "m5.large".

``Collaboration``: You can create different ``.tfvars`` files for different environments (e.g., dev.tfvars, staging.tfvars, prod.tfvars) and easily switch between them when deploying. This avoid conflict when different people working in the same terraform project.

``Managing Sensitive Data``: While it's generally not recommended to store highly sensitive data directly in plain text ``.tfvars`` files that are committed to version control, they can be used for less sensitive parameters. For very sensitive data such as API keys, passwords, you should use tools like HashiCorp Vault, environment variables, or other secrets management solutions.

## Here's how you use .tfvars
1. Define your input variable in your terraform code (file-variable.tf)
2. Create one or more ``.tfvars`` file in this file containing value for specific input variable
3. When running terraform command (e.g terraform plan, terraform apply) you can spesify which ``.tfvars`` files to use within .tfvars file

By using ``.tfvars`` you can keep your terraform code more flexible while tailoring configuration to different scenario and environment.