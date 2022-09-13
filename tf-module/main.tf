/*
    Configure:
        #TODO
        git tag v0.0.1
        git push --tags
        
    Execute:
        terraform init
        terraform apply -auto-approve
    
    Observe:
        How modules are sourced from different source
        The output from each module

*/

terraform {
  
}

# Using tf module from local path
module "local_module" {
  source = "./modules/simple_module"
  name = "Local Anonymous"
}
output "local_module_output" {
  value = module.local_module.module_output
}

# using tf module from public terraform repo

# Using tf module from public github repo
module "git_module" {
  source = "git::https://github.com/ArghyaChakraborty/terraform-experiments.git//tf-module/modules/simple_module?ref=v0.0.1"
  name = "Git Anonymous"
}
output "git_module_output" {
  value = module.git_module.module_output
}

# Using count
module "local_module_with_count" {
  count = 2
  source = "./modules/simple_module"
  name = "Person ${count.index}"
}
output "local_module_output_with_count" {
  value = module.local_module_with_count.*.module_output
}

# Using for_each
module "local_module_with_foreach" {
  for_each = {
    "Sheldon" = "Cooper"
    "Howard" = "Wolowitz" 
  }
  source = "./modules/simple_module"
  name = "${each.key} ${each.value}"
}
output "local_module_output_with_foreach" {
  value = module.local_module_with_foreach.*
}
