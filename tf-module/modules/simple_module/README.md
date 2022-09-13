# Simple Module

## Description
The simple module just takes a `name` input argument and outputs `Hello <name> !!!` string.

## Usage
```
module "simple_module" {
    source = "./modules/simple_module"
    name = "Xyz"
}
```

## Accessing output
```
output "test" {
    value = module.simple_module.module_output
}
```
