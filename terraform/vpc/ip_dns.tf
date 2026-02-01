# Static External IP for Ingress Load Balancer
resource "google_compute_address" "ingress_static_ip" {
  name         = "hackathon-ingress-static-ip"
  region       = "asia-south1" # Must be in the same region as the GKE cluster
  address_type = "EXTERNAL"
}
resource "google_dns_managed_zone" "primary_zone" {
  name        = "hackathon-zone"
  dns_name    = "hackathon-test.saikola." # Replace with your actual domain, must end with a dot
  description = "Managed zone for hackathon project"
  project     = "project-4b8711e6-1e25-4675-ae6"
}

resource "google_dns_record_set" "ingress_a_record" {
  name         = "hackathon-test.saikola." # Replace with your actual domain, must end with a dot
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.primary_zone.name
  rrdatas      = [google_compute_address.ingress_static_ip.address] # Reference the static IP
}
