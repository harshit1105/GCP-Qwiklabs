module "service_account" {
  source = "./modules/service_account"
  account_id = var.account_id
  display_name = var.display_name
  my_project = var.my_project
}

module "iam_binding" {
  source = "./modules/iam_binding"
  my_project = var.my_project
  roles = var.roles
  members = ["serviceAccount:${module.service_account.service_account_email}"]
}