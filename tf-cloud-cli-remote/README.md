# Using public Terraform cloud in CLI workflow
## Configure:
- Create Terraform cloud account  
- Create an organization  
- Create a workspace and choose `CLI Driven workflow`  
- After workspace is created, create variables in workspace:  
  - `AWS_ACCESS_KEY_ID` (set access key id) choose `Environment` category  
  - `AWS_SECRET_ACCESS_KEY` (set secret access key) choose `Environment` category  
  - `AWS_DEFAULT_REGION` (set target AWS region) choose `Environment` category  
  - `lambda_input_name` (some random name) choose `Terraform` category  
- Also replace `organization` & `workspace.name` in `provider.tf`  
## Execute:
- `terraform init`  
- `terraform apply -auto-approve`  
## Observe:
- The output of the execution in Terraform cloud as well as in the local CLI
