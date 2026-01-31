resource "google_storage_bucket" "terraform" {
  name          = "tf-state-bucket"
  location      = "ASIA-SOUTH2"
  force_destroy = true
  uniform_bucket_level_access = true
}