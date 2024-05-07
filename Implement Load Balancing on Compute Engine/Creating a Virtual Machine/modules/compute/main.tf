resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["http-server"]
  
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

  metadata = {
    ssh-keys = "${var.username}:${file("${var.filepath_pub}")}"
  }
  connection {
    type        = "ssh"
    user        = var.username
    private_key = file("${var.filepath_key}")
    host        = self.network_interface[0].access_config[0].nat_ip
  }
   provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "ps auwx | grep nginx"
    ]
  }
}

output "instance_name" {
  value = google_compute_instance.vm_instance.name
}