resource "google_compute_instance" "web-server" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  tags = ["allow-http", "allow-internal-ssh"]


  metadata_startup_script = file("./modules/compute_engine/startup.txt")

  network_interface {
    network    = var.privatenet.name
    subnetwork = var.privatesubnet-app.name

    access_config {}
  }
}

resource "google_compute_instance" "bastion" {
  name         = "bastion"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  tags = ["allow-ssh-from-iap"]

  network_interface {
    network    = var.privatenet.name
    subnetwork = var.privatesubnet-mgmt.name

    access_config {}
  }
}
