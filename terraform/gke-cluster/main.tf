resource "google_container_cluster" "primary" {
  name     = "hackathon-cluster"
  location = "us-central1"

  # Enabling Autopilot mode
  enable_autopilot = true
  network          = google_compute_network.vpc.name
  subnetwork       = google_compute_subnetwork.subnet.name

  # Setting a deletion protection (set to false for easy cleanup after hackathon)
  deletion_protection = false
}