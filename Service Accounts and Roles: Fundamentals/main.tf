module "editor_service_account" {
  source       = "./modules/service_account"
  account_id   = "my-sa-123"
  display_name = "my service account"
}

module "bigquery_service_account" {
  source       = "./modules/service_account"
  account_id   = "bigquery-qwiklab"
  display_name = "my bigquery service account"
}

module "iam_roles_editor" {
  source             = "./modules/iam_roles"
  my_project         = var.my_project
  roles_with_members = { "roles/editor" = ["serviceAccount:${module.editor_service_account.email}"] }
}

module "iam_roles_bigquery" {
  source             = "./modules/iam_roles"
  my_project         = var.my_project
  roles_with_members = { "roles/bigquery.user" = ["serviceAccount:${module.bigquery_service_account.email}"], "roles/bigquery.dataViewer" = ["serviceAccount:${module.bigquery_service_account.email}"] }
}

module "bigquery_vm" {
  source                = "./modules/compute"
  my_project            = var.my_project
  name                  = "bigquery-instance"
  zone                  = var.zone
  machine_type          = "e2-medium"
  service_account_email = module.bigquery_service_account.email
}

output "bigquery_service_account_email" {
  value = module.bigquery_service_account.email
}

output "vm_instance_name" {
  value = module.bigquery_vm.instance_name
}