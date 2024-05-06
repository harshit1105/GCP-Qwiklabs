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
  metadata = {
    ssh-keys = "${var.username}:${file("${var.filepath}")}"
  }
  connection {
    type        = "ssh"
    user        = var.username
    private_key = file("${var.filepath}")
    host        = self.network_interface[0].access_config[0].nat_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y git python3-pip",
      "pip3 install --upgrade pip",
      "pip3 install google-cloud-bigquery pyarrow pandas db-dtypes",
      "echo '\nfrom google.auth import compute_engine\nfrom google.cloud import bigquery\n\ncredentials = compute_engine.Credentials(\n    service_account_email=\"bigquery-qwiklab@${var.my_project}.iam.gserviceaccount.com\")\n\nquery = \"\"\"\nSELECT\n  year,\n  COUNT(1) as num_babies\nFROM\n  publicdata.samples.natality\nWHERE\n  year > 2000\nGROUP BY\n  year\n\"\"\"\n\nclient = bigquery.Client(\n    project=\"${var.my_project}\",\n    credentials=credentials)\nprint(client.query(query).to_dataframe())\n' > query.py",
      "python3 query.py"
    ]
  }
}

output "instance_name" {
  value = google_compute_instance.vm_instance.name
}