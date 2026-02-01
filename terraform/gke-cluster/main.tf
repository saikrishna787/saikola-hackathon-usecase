resource "google_container_cluster" "hackathon_cluster" {
  name     = "hackathon-cluster"
  location = "us-central1"

  # Enabling Autopilot mode
  enable_autopilot = true
  network          = "projects/project-4b8711e6-1e25-4675-ae6/global/networks/hackathon-vpc"
  subnetwork       = "projects/project-4b8711e6-1e25-4675-ae6/regions/asia-south2/subnetworks/private-subnet-south"

  # Setting a deletion protection (set to false for easy cleanup after hackathon)
  deletion_protection = false
  # node_pool {
  #   name       = "default-pool"
  #   node_count = 1
  #   management {
  #     auto_repair  = true
  #     auto_upgrade = true
  #   }
  # }

}