terraform {
  backend "gcs" {
    bucket = "tfstatebucket-unique-2026"
    prefix = "gke-cluster"
  }
}
