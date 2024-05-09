module "instance1" {
  source       = "./modules/compute"
  my_project   = var.my_project
  name         = "instance1"
  zone         = var.zone
  machine_type = "e2-medium"
}