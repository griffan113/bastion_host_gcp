output "privatenet" {
  value = google_compute_network.privatenet
}

output "privatesubnet-mgmt" {
  value = google_compute_subnetwork.privatesubnet-mgmt
}

output "privatesubnet-app" {
  value = google_compute_subnetwork.privatesubnet-app
}
