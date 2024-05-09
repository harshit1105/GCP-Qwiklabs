variable "my_project" {
  type        = string
  description = "Project ID to be provided"
}

variable "zone" {
  type        = string
  description = "Zone for compute engine"
}

variable "name" {
  type        = string
  description = "Machine Name for compute engine"
}

variable "machine_type" {
  type        = string
  description = "Machine Type for compute engine"
}