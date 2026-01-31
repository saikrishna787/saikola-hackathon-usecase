resource "google_compute_network" "vpc" {
  name                    = "hackathon-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet-south"
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-south2"
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet-south"
  ip_cidr_range = "10.0.2.0/24"
  region        = "asia-south2"
  network       = google_compute_network.vpc.id
  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.64.0/18"
  }
  secondary_ip_range {
    range_name    = "service-ranges"
    ip_cidr_range = "192.168.1.0/24"
  }
}
