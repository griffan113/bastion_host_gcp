resource "google_compute_firewall" "privatenet-allow-http" {
  name          = "privatenet-allow-http"
  network       = var.privatenet.name
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "privatenet-allow-ssh-from-iap" {
  name          = "privatenet-allow-ssh-from-iap"
  network       = var.privatenet.name
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["allow-ssh-from-iap"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "privatenet-allow-internal-ssh" {
  name          = "privatenet-allow-internal-ssh"
  network       = var.privatenet.name
  source_ranges = [var.privatesubnet-mgmt-ip-ranges]
  target_tags   = ["allow-internal-ssh"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
