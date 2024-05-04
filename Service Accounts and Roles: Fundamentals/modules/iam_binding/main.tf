resource "google_project_iam_binding" "role_binding" {
  project = var.my_project
  role = var.roles
  members = var.members
}

output "members" {
  value = var.members
}