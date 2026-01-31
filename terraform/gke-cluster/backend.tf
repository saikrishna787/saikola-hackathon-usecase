terraform {
  backend "gcs" {
    bucket = "tf-state-bucket"
    prefix = "gke-cluster"
  }
}
