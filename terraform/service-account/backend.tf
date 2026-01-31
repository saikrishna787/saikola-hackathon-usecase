terraform {
  backend "gcs" {
    bucket = "tf-state-bucket"
    prefix = "service-account"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.7.0"
    }
  }
}
