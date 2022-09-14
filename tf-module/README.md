# Using Terraform Modules
## Configure:
### For using modules from GitHub
- `git add .`  
- `git commit -m "Initial Commit"`  
- `git push origin main`  
- `git tag v1.0.0`  
- `git push --tags`  
### For using modules from Terraform registry
- Login to https://app.terraform.io/ -> Registry -> Publish -> Module  
- Connect to VCS -> GitHub -> GitHub.com (custom) -> Follow the instructions provided  
- Also need to generate SSH keypair. You can use this online website for the same: https://travistidwell.com/jsencrypt/demo/  
- Copy the private part of the keypair in Terraform & keep the private & public parts with you  
- Once done, go to https://app.terraform.io/ again -> Registry -> Publish -> Module  
- Choose the registered GitHub -> choose this repository -> Publish Module  
## Execute:
- `terraform init`  
- `terraform apply -auto-approve`  
## Observe:
- How modules are sourced from different source  
- The output from each module  
