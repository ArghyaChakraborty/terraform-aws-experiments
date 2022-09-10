/*
    Configure:
        Create Terraform cloud account
        Create an organization
        Create a workspace and choose CLI Driven workflow
        After workspace is created, create variables in workspace:
          AWS_ACCESS_KEY_ID (set access key id) => env category
          AWS_SECRET_ACCESS_KEY (set secret access key) => env category
          AWS_DEFAULT_REGION (set target AWS region) => env category
          lambda_input_name (some random name) => terraform category
        Also replace organization & workspace.name in provider.tf

    Execute:
        terraform init
        terraform apply -auto-approve
    
    Observe:
        The output of the execution in Terraform cloud as well as in the local CLI

*/

resource "aws_iam_role" "iam_for_test_lambda" {
  name = "iam_for_test_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "lambda_function.zip"
  function_name = "test_lambda"
  role          = aws_iam_role.iam_for_test_lambda.arn
  handler       = "lambda_function.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("lambda_function.zip")

  runtime = "python3.9"

  environment {
    variables = {
      name = "${var.lambda_input_name}"
    }
  }
}