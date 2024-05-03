resource "google_compute_project_default_network_tier" "default" {
  network_tier = "PREMIUM"
}

resource "google_compute_instance" "default" {
  name         = var.machine_name_1
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

resource "google_compute_instance" "baba" {
  name         = var.machine_name_2
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