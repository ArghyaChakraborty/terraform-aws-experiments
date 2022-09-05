variable "lambda_input_name" {
  description = "Input to the Lambda function via lambda env var"
  type = string
  default = "World"
}

variable "aws_access_key_id" {
  description = "AWS Access Key Id"
  type = string
}
variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type = string
}
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}
