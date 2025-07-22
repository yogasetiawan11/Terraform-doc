# What is built-in function
Terraform function are built-in reusable blocks code that perform specific task in Terraform configuration (this task can be calculating length, building complex variable etc). 

Terraform provide wide range of builtin function that you can use within configuration files (usually written in Hashicorp Languange) to manipulate and transform data. Here are the example use case:

1. concat(list1, list2, ...) Combine multiple list into single list
### Example 
```bash
variable = "list_1" {
    type = "list"
    default = ["item1", "item2"]
}

varible = "List_2"{
    type  = "list"
    default = ["item3", "item4"]
}

output "combine_list" {
    value = concat(var.list_1, var.List_2)
}
```

2. element () return element at specific index in a list
```bash
variable = "my_variable" {
    type = list
    default = ["value1", "value2", "value3"
}

output "my_variable_output" {
    value = element(var.my_variable, 1)
}
```

3. lenght(list) return the number of element in a list
```bash
variable = "my_variable" {
    type = list
    default = ["vm_1", "vm_2", "vm_3"]
}

output = "list_length"{
     value = length(var.my_variable) # Returns 3
}
```

These are a few command of Built-in function. to get full Built-in function you can refer to the documentation Terraform