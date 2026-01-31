resource "kubernetes_namespace" "hackathon_ns" {
  metadata {
    name = "application-service-ns"
  }
}


resource "google_compute_global_address" "ingress_ip" {
  name = "hackathon-ingress-ip"
  purpose = "VPC_PEERING"
  address_type = "INTERNAL"
  prefix_length = 16
  network = "${google_compute_network.vpc.self_link}"
}