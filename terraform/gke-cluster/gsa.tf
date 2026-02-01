resource "google_service_account" "github_actions_gke_deployer" {
  account_id   = "github-actions-gke-deployer"
  display_name = "Service Account for GitHub Actions GKE Deployments"
  project      = "project-4b8711e6-1e25-4675-ae6"
}

resource "google_project_iam_member" "gke_developer_binding" {
  project = "project-4b8711e6-1e25-4675-ae6"
  role    = "roles/container.developer" # Grants permissions to deploy to GKE
  member  = "serviceAccount:${google_service_account.github_actions_gke_deployer.email}"
}

# Data source to get the project number for Workload Identity binding
data "google_project" "project" {
  project_id = "project-4b8711e6-1e25-4675-ae6"
}

resource "kubernetes_service_account_v1" "github_actions_ksa" {
  metadata {
    name      = "github-actions-ksa"
    namespace = kubernetes_namespace_v1.hackathon_ns.metadata[0].name # Refers to "application-service-ns"
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.github_actions_gke_deployer.email
    }
  }
}

resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.github_actions_gke_deployer.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${data.google_project.project.project_id}.svc.id.goog/subject/ns/${kubernetes_namespace_v1.hackathon_ns.metadata[0].name}/sa/${kubernetes_service_account_v1.github_actions_ksa.metadata[0].name}"
}
