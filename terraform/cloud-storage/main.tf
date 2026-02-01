resource "google_storage_bucket" "terraform" {
  name          = "tfstatebucket-unique-2026"
  location      = "asia-south1"
  force_destroy = true
  uniform_bucket_level_access = true
}