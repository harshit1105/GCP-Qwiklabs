resource "google_project_iam_binding" "role_binding" {
  for_each = var.roles_with_members
  project = var.my_project
  role = each.key
  members = each.value
}

output "roles" {
  value = [for rb in google_project_iam_binding.role_binding : rb.role]
}