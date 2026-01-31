resource "google_service_account" "app_service_account" {
  account_id   = "app-service-account"
  display_name = "Service Account for Application"
}

