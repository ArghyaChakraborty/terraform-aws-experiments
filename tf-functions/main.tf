terraform {
  
}

output "math_max" {
  value = max(2, 10, 1)
}
output "math_min" {
  value = max(2, 10, 1)
}
output "math_parseint" {
  value = parseint("10", 16)
}
output "math_signum" {
  value = signum(-100)
}

output "math_z_break" {
  value = "----------------------------"
}

output "string_format" {
  value = format("Hello %s, are you %d years old ?", "User", 20)
}
output "string_formatlist" {
  value = formatlist("Hello %s, are you %d years old ?", ["Sheldon", "Amy"], [30, 25])
}
output "string_indent" {
  value = indent(2, "{\n\"f_name\":\"Sheldon\", \n\"l_name\": \"Cooper\"\n}")
}
output "string_join" {
  value = join(", ", ["Sheldon", "Raj", "Amy", "Penny"])
}
output "string_split" {
  value = split(",", "Sheldon,Raj,Amy,Penny")
}
output "string_regex_1" {
  value = regex("^S.+n$", "Sheldon")
}
output "string_regex_2" {
  value = try(regex("^S.+n$", "Amy"), "No match found")
}
output "string_regexall" {
  value = regexall("The", "The Big Bang Theory is The biggest show on Earth !!!")
}
output "string_replace" {
  value = replace("Raj was a better scientist", "Raj", "Sheldon")
}
output "string_title" {
  value = title("dr. sheldon cooper")
}
output "string_chomp" {
  value = chomp("\nThe Big Bang Theory\n\n")
}
output "string_trim" {
  value = trim(" \nThe Big Bang Theory\n\n", "\n")
}
output "string_trimspace" {
  value = trimspace(" \n The Big Bang Theory\n\n ")
}

output "string_z_break" {
  value = "----------------------------"
}

output "collection_alltrue_1" {
  value = alltrue([3>5, 2<5])
}
output "collection_alltrue_2" {
  value = alltrue([])
}
output "collection_anytrue_1" {
  value = anytrue([3>5, 2<5])
}
output "collection_anytrue_2" {
  value = anytrue([])
}
output "collection_chunklist" {
  value = chunklist([1, 2, 3, 4, 5], 3)
}
output "collection_coalesce_1" {
  value = coalesce("a", "b", "c")
}
output "collection_coalesce_2" {
  value = coalesce(null, "b", "c")
}
output "collection_coalescelist_1" {
  value = coalescelist(["a"], ["b"], ["c"])
}
output "collection_coalescelist_2" {
  value = coalescelist([], ["b"], ["c"])
}
output "collection_compact" {
  value = compact([null, "b", "c"])
}
output "collection_concat" {
  value = concat([], ["b"], ["c"])
}
output "collection_contains_1" {
  value = contains(["Sheldon", "Raj", "Amy"], "Raj")
}
output "collection_contains_2" {
  value = contains(["Sheldon", "Raj", "Amy"], "Penny")
}
output "collection_index_1" {
  value = index(["Sheldon", "Raj", "Amy"], "Raj")
}
output "collection_index_2" {
  value = try(index(["Sheldon", "Raj", "Amy"], "Penny"), "Item not found")
}
output "collection_element_1" {
  value = element(["Sheldon", "Raj", "Amy"], 2)
}
output "collection_element_2" {
  value = element(["Sheldon", "Raj", "Amy"], 3)
}
output "collection_keys" {
  value = keys({"name": "Sheldon", "job": "Scientist"})
}
output "collection_values" {
  value = values({"name": "Sheldon", "job": "Scientist"})
}
output "collection_flatten" {
  value = flatten([[[["Amy"]]], [["Sheldon"]]])
}
output "collection_length_1" {
  value = length(["Sheldon"])
}
output "collection_length_2" {
  value = length("Sheldon")
}
output "collection_length_3" {
  value = length({"name": "Sheldon"})
}
output "collection_lookup_1" {
  value = lookup({"Sheldon": "Cooper", "Raj": "Koothrapalli"}, "Raj")
}
output "collection_lookup_2" {
  value = try(lookup({"Sheldon": "Cooper", "Raj": "Koothrapalli"}, "Amy"), "Key not found")
}
output "collection_sort" {
  value = sort([2, 1, 5, 10])
}

output "collection_z_break" {
  value = "----------------------------"
}

output "endecode_jsonencode" {
  value = jsonencode({"name": "Sheldon"})
}
output "endecode_jsondecode" {
  value = jsondecode("{\"name\": \"Sheldon\"}")
}
output "endecode_base64encode" {
  value = base64encode("Sheldon Cooper")
}
output "endecode_base64decode" {
  value = base64decode(base64encode("Sheldon Cooper"))
}
output "endecode_urlencode" {
  value = "http://localhost:80/getProfession?name=${urlencode("Sheldon Cooper")}"
}

output "endecode_z_break" {
  value = "----------------------------"
}

output "file_abspath" {
  value = abspath("./main.tf")
}
output "file_basename" {
  value = basename(abspath("./main.tf"))
}
output "file_dirname" {
  value = dirname(abspath("./main.tf"))
}
output "file_fileexists" {
  value = fileexists("templatefile.tftpl")
}
output "file_file" {
  value = file("templatefile.tftpl")
}
output "file_templatefile" {
  value = templatefile("templatefile.tftpl", {word: "World"})
}

output "file_z_break" {
  value = "----------------------------"
}

output "datetime_timestamp" {
  value = timestamp()
}
output "datetime_formatdate" {
  value = formatdate("YYYY-MM-DD", timestamp())
}

output "datetime_z_break" {
  value = "----------------------------"
}

output "crypto_uuid" {
  value = uuid()
}
output "crypto_filesha512" {
  value = filesha512("./templatefile.tftpl")
}

output "crypto_z_break" {
  value = "----------------------------"
}

output "type_can_1" {
  value = can(tonumber("absolutely not"))
}
output "type_can_2" {
  value = can(lookup({"Sheldon": "Cooper", "Raj": "Koothrapalli"}, "Amy"))
}
output "type_can_3" {
  value = can(lookup({"Sheldon": "Cooper", "Raj": "Koothrapalli"}, "Raj"))
}
output "type_try" {
  value = try(tonumber("absolutely not"), "Type conversion not possible")
}
output "type_sensitive" {
  sensitive = true
  value = sensitive("super secret")
}
output "type_nonsensitive" {
  value = nonsensitive(sensitive("super secret"))
}

output "type_z_break" {
  value = "----------------------------"
}


output "network_TODO" {
  value = "#TODO"
}

output "network_z_break" {
  value = "----------------------------"
}