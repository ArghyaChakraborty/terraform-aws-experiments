# Using Terraform public cloud in VCS workflow
## Configure:
- Create Terraform cloud account  
- Create an organization  
- Create a workspace and choose `VCS workflow`
- Link your VCS provider & select this repo as source
- Select `tf-cloud-vcs` as `Terraform Working Directory` under `Advanced Settings`  
- After workspace is created, create variables in workspace:  
  - `AWS_ACCESS_KEY_ID` (set access key id) choose `Environment` category  
  - `AWS_SECRET_ACCESS_KEY` (set secret access key) choose `Environment` category  
  - `AWS_DEFAULT_REGION` (set target AWS region) choose `Environment` category  
  - `lambda_input_name` (some random name) choose `Terraform` category  
## Execute:
- For the first time after the workspace is created: [Actions] -> [Start new run] -> Plan and apply (standard)  
- From next time onwards whenever a new push/merge to main branch happens, the workflow will automatically run  
## Observe:
- The output of each run  
