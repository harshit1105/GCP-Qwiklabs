variable "my_project" {
  type        = string
  description = "Project ID to be provided"
}

variable "roles_with_members" {
  type        = map(list(string))
  description = "Map of roles to their corrosponding member lists"
}