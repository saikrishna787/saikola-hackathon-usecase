resource "kubernetes_namespace_v1" "hackathon_ns" {
  metadata {
    name = "application-service-ns"
  }
}


resource "google_compute_global_address" "ingress_ip" {
  name = "hackathon-ingress-ip"
  purpose = "VPC_PEERING"
  address_type = "INTERNAL"
  prefix_length = 16
  network = "projects/project-4b8711e6-1e25-4675-ae6/global/networks/hackathon-vpc"
}