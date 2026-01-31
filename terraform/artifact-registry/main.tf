resource "google_artifact_registry_repository" "hackathon_images" {
  project       = "project-4b8711e6-1e25-4675-ae6project-4b8711e6-1e25-4675-ae6"
  location      = "asia-south1"
  repository_id = "hackathon-images"
  description   = "Docker repository for Node and Java services"
  format        = "DOCKER"

  # Recommended: Deletes older images to save costs
  cleanup_policies {
    id     = "delete-old-images"
    action = "DELETE"
    condition {
      tag_state  = "ANY"
      older_than = "604800s" # 7 days
    }
  }
}
