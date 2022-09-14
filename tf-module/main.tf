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

# Using tf module from public terraform registry
module "terraform_module" {
  source  = "app.terraform.io/arghya_company/experiments/aws//tf-module/modules/simple_module"
  version = "0.0.1"
  name = "Terraform Anonymous"
}
output "terraform_module_output" {
  value = module.terraform_module.module_output
}

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

# Using for_each with a map
module "local_module_with_foreach_map" {
  for_each = {
    "Sheldon" = "Cooper"
    "Howard" = "Wolowitz" 
  }
  source = "./modules/simple_module"
  name = "${each.key} ${each.value}"
}
output "local_module_output_with_foreach_map" {
  value = module.local_module_with_foreach_map.*
}

# Using for_each with a set
module "local_module_with_foreach_set" {
  for_each = toset(["Sheldon", "Amy", "Leonard", "Penny"])
  source = "./modules/simple_module"
  name = "${each.key} ${each.value}"
}
output "local_module_output_with_foreach_set" {
  value = module.local_module_with_foreach_set.*
}
