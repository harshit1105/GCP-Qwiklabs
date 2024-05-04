resource "google_compute_instance" "default" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.my_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }

}