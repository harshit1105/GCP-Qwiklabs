resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    email = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

output "instance_name" {
  value = google_compute_instance.vm_instance.name
}