terraform {
  
}

variable "homogeneous_list" {
  type = list(string)
  default = ["Sheldon", "Amy", "Penny", "Leonard", "Raj", "Howard", "Bernadette"]
}
variable "heterogeneous_list" {
  type = list
  default = ["Sheldon", 32]
}

variable "test_map" {
    type = map(string)
    default = {
      "name": "Sheldon"
      "profession": "Scientist"
    }
}

variable "homogeneous_set" {
  type = set(string)
  default = ["Sheldon", "Amy", "Penny", "Leonard", "Raj", "Howard", "Bernadette"]
}

variable "example_object" {
  type = object({
      name = string
      profession = string
      age = number
  })
  default = {
    age = 32
    name = "Sheldon"
    profession = "Scientist"
  }
}

variable "example_tuple_1" {
  type = tuple([string, string])
  default = ["Sheldon", "Amy"]
}
variable "example_tuple_2" {
  type = tuple([string, number])
  default = ["Sheldon", 32]
}

output "list_homogeneous_list" {
  value = var.homogeneous_list
}
output "list_homogeneous_list_first_element" {
  value = var.homogeneous_list[0]
}
output "list_heterogeneous_list" {
  value = var.heterogeneous_list
}
output "list_heterogeneous_list_last_element" {
  value = var.heterogeneous_list[length(var.heterogeneous_list)-1]
}

output "list_z_seperator" {
  value = "----------------------"
}

output "map_test_map" {
  value = var.test_map
}
output "map_test_map_keys" {
  value = keys(var.test_map)
}
output "map_test_map_element" {
  value = var.test_map["name"]
}

output "map_z_seperator" {
  value = "----------------------"
}

output "set_homogeneous_set" {
  value = var.homogeneous_set
}
output "set_homogeneous_set_first_element" {
  value = tolist(var.homogeneous_set)[0]
}

output "set_z_seperator" {
  value = "----------------------"
}

output "object_example_object" {
  value = var.example_object
}
output "object_example_object_attribute" {
  value = var.example_object["name"]
}

output "object_z_seperator" {
  value = "----------------------"
}

output "tuple_example_tuple_1" {
  value = var.example_tuple_1
}
output "tuple_example_tuple_2" {
  value = var.example_tuple_2
}
output "tuple_example_tuple_2_first_element" {
  value = var.example_tuple_2[0]
}

output "tuple_z_seperator" {
  value = "----------------------"
}