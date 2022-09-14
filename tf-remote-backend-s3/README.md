# Terraform Backend Using AWS S3
## Configure:
- `aws configure --profile <profile name>` (then enter access key, secret access key, region in the prompt)  
- Create a S3 bucket  
- Replace `bucket name` in `terraform.backend s3.bucket` in `main.tf`  
- Replace `profile name` in `terraform.backend s3.profile` and `provider aws.profile` in `main.tf` 
## Execute:
- `terraform init`  
- `terraform workspace new dev || terraform workspace select prod`  
- `terraform apply -auto-approve`  
- `terraform workspace new prod || terraform workspace select prod`  
- `terraform apply -auto-approve`  
## Observe:
- The new directories/files created in S3 bucket
  