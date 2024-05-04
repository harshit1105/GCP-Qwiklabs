variable "my_project" {
  type        = string
  description = "Project ID to be provided"
}

variable "roles" {
  type        = string
  description = "Display Name of Account ID"
}

variable "members" {
  type        = list(string)
  description = "Member details"
}