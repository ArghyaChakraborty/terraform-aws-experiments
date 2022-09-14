/*
    Configure:
        For using modules from GitHub
            git add .
            git commit -m "Initial Commit"
            git push origin main
            git tag vx.y.x
            git push --tags
            Also replace `vx.y.z` in git module example's source (value of ref parameter)
        For using modules from Terraform registry
            Login to https://app.terraform.io/ -> Registry -> Publish -> Module
            Connect to VCS -> GitHub -> GitHub.com (custom) -> Follow the instructions provided
            Also need to generate SSH keypair. You can use this online website for the same: https://travistidwell.com/jsencrypt/demo/
            Copy the private part of the keypair in Terraform & keep the private & public parts with you
            Once done, go to https://app.terraform.io/ again -> Registry -> Publish -> Module
            Choose the registered GitHub -> 
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

# Using tf module from public terraform registry

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
