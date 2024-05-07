module "gcplab" {
  source       = "./modules/compute"
  my_project   = var.my_project
  name         = "gcelab"
  zone         = var.zone
  machine_type = "e2-medium"
  username     = var.username
  filepath_pub = var.filepath_pub
  filepath_key = var.filepath_key
}

module "gcplab2" {
  source       = "./modules/compute"
  my_project   = var.my_project
  name         = "gcelab2"
  zone         = var.zone
  machine_type = "e2-medium"
  username     = var.username
  filepath_pub = var.filepath_pub
  filepath_key = var.filepath_key
}