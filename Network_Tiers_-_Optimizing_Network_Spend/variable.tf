variable "my_project" {
  type        = string
  description = "Project ID to be provided"
}

variable "my_region" {
  type        = string
  description = "Region for compute engine"
}

variable "my_zone" {
  type        = string
  description = "Zone for compute engine"
}

variable "machine_name" {
  type        = string
  description = "Machine Name for compute engine"
}

variable "machine_type" {
  type        = string
  description = "Machine Type for compute engine"
}

variable "network_tier" {
  type = map(string)
  default = {
    "vm-premium"  = "PREMIUM"
    "vm-standard" = "STANDARD"
  }
  description = "Machine Type for compute engine"
}