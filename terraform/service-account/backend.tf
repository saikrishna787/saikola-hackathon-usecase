terraform {
  backend "gcs" {
    bucket = "tfstatebucket-unique-2026"
    prefix = "service-account"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.7.0"
    }
  }
}
