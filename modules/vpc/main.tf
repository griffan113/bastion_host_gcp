resource "google_compute_network" "privatenet" {
  name                    = "privatenet"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "privatesubnet-mgmt" {
  network       = google_compute_network.privatenet.name
  name          = "privatesubnet-mgmt"
  ip_cidr_range = var.privatesubnet-mgmt-ip-ranges
  region        = "us-east1"
}

resource "google_compute_subnetwork" "privatesubnet-app" {
  network       = google_compute_network.privatenet.name
  name          = "privatesubnet-app"
  ip_cidr_range = var.privatesubnet-app-ip-ranges
  region        = "us-east1"
}
