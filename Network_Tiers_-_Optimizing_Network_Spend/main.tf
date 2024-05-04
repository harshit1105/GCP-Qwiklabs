module "compute_instance_1" {
  source       = "./modules/compute"
  machine_name = var.machine_name
  machine_type = var.machine_type
  my_project   = var.my_project
  my_region    = var.my_region
  my_zone      = var.my_zone
  network_tier = lookup(var.network_tier, var.machine_name, "STANDARD")
}

module "compute_instance_2" {
  source       = "./modules/compute"
  machine_name = "vm-standard"
  machine_type = var.machine_type
  my_project   = var.my_project
  my_region    = var.my_region
  my_zone      = var.my_zone
  network_tier = lookup(var.network_tier, "vm-standard", "STANDARD")
}