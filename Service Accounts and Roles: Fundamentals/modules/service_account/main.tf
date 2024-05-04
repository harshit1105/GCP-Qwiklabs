resource "google_service_account" "new_service_account" {
  project = var.my_project
  account_id   = var.account_id
  display_name = var.display_name
}

output "service_account_email" {
  value = google_service_account.new_service_account.email
}