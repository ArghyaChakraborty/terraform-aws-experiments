terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.31.0"
    }
  }
}

provider "aws" {
  profile = "aws-personal"
  region = "us-east-1"
}

# String examples
#   Standard heredoc string example
variable "string_heredoc_1" {
  type = string
  default = <<EOF
    This is an amazing
      multi-line string
  EOF
}
output "string_heredoc_1_output" {
  value = var.string_heredoc_1
}

#   Indented heredoc string example
variable "string_heredoc_2" {
  type = string
  default = <<-EOF
    This is an amazing
      multi-line string
  EOF
}
output "string_heredoc_2_output" {
  value = var.string_heredoc_2
}

#   String interpolation example
output "string_interpolation_1" {
  value = "We are working in following Terraform workspace \n \"${terraform.workspace}\""
}
output "string_interpolation_2" {
  value = <<-EOF
    We are working in following Terraform workspace
        "${terraform.workspace}"
  EOF
}

#   String directive example
variable "usernames" {
  type = list(string)
  default = [
      "Sheldon", "Amy", "Leonard", "Penny", "Howard", "Bernadette", "Rajesh"
  ]
}
output "string_directive_1" {
  value = "%{if length(var.usernames) > 0 ~}Hello ${join(",", var.usernames)}%{else ~}Hello Cast of Big Bang Theory%{endif ~}"
}
output "string_directive_2" {
  value = <<-EOT
  Here are the cast of The Big Bang Theory:
  %{for c in var.usernames~}
    ${c}
  %{endfor~}
  EOT
}

output "string_z_divider" {
  value = "\n----------------------\n"
}

# Collections examples
#   For expression returning a list
variable "map_1" {
  type = map(object({
      fname = string
      lname = string
      gender = string
  }))
  default = {
    "Sheldon" = {fname = "Sheldon", lname = "Cooper", gender = "male"}
    "Amy" = {fname = "Amy", lname = "Ferrfowler", gender = "female"}
    "Rajesh" = {fname = "Rajesh", lname = "Kuthrapalli", gender = "male"}
  }
}
output "collection_map_to_list" {
  value = [for v in var.map_1: jsonencode(v)]
}

#   For expression returning a map
output "collection_map_to_map" {
  value = {for k,v in var.map_1: upper(k) => jsonencode(v)}
}

#   For expression with if condition
output "collection_map_to_partial_list" {
  value = [for v in var.map_1: jsonencode(v) if v.gender == "male"]
}

#   Invert a map with {key => val} to {val => [key]} using grouping expression (...)
variable "map_2" {
  type = map(string)
  default = {
    "Sheldon" = "Episode 1"
    "Howard" = "Episode 1"
    "Leonard" = "Episode 1"
    "Rajesh" = "Episode 1"
    "Penny" = "Episode 2"
  }
}
output "collection_map_inversion" {
  value = {for k, v in var.map_2: v => k...}
}

#   An object & map with valid elements extracted using splat expression
variable "main_cast" {
  type = object({name = string, age = number})
  default = {
    age = 30
    name = "Dr. Sheldon Cooper"
  }
}
output "collection_map_splat" {
  value = var.map_1[*]
}
output "collection_object_splat" {
  value = var.main_cast[*]
}

#   An object & map with null as value extracted using splat expression
variable "null_map" {
  type = map(string)
  default = null
}
variable "null_object" {
  type = object({name = string, age = number})
  default = null
}
output "collection_null_map_splat" {
  value = var.null_map[*]
}
output "collection_null_object_splat" {
  value = var.null_object[*]
}

output "collection_z_divider" {
  value = "\n----------------------\n"
}

# Validation examples
#   Input variable validation check
variable "non_empty_list" {
  type = list
  default = ["Sheldon", "Leonard"]
  validation {
    condition = length(var.non_empty_list) > 0
    error_message = "The list must contain atleast 1 element."
  }
}
output "validation_print_non_empty_list" {
  value = var.non_empty_list
}

#   Output variable pre-condition check
output "validation_output_precondition_check" {
  value = var.non_empty_list
  precondition {
    condition = length(var.non_empty_list) > 0
    error_message = "The list must contain atleast 1 element."  
  }
}

#   Data source pre-condition check
data "aws_ami" "example" {
  most_recent      = true

  filter {
    name   = "description"
    values = ["Amazon Linux 2"]
  }

  lifecycle {
    postcondition {
      condition = self.architecture == "x86_64"
      error_message = "The AMI architecture must be x86_64."
    }
  }

}
output "validation_data_postcondition_check" {
  value = data.aws_ami.example
}

output "validation_z_divider" {
  value = "\n----------------------\n"
}


# Terraform out of the box variable examples
#   Using path.module, path.root, path.cwd, terraform.workspace
output "terraform_variables" {
  value = <<-EOT
  Terraform out-of-the-box variables:
    path.module = ${path.module}
    path.root = ${path.root}
    path.cwd = ${path.cwd}
    terraform.workspace = ${terraform.workspace}
  EOT
}

output "terraform_z_divider" {
  value = "\n----------------------\n"
}
