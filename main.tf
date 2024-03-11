provider "google" {
  credentials = jsondecode(base64decode(var.gcp_sa_key))
  project = "zb-poc"
  region = "us-east1"
}

resource "google_storage_bucket" "terraform_state" {
  name = "zb-poc-bucket"
  location = "us"
}

resource "google_container_cluster" "my_cluster" {
  name = "zb-gke"
  location = "us-east1"

  initial_node_count = 2

  node_config {
    machine_type = "n1-standard-2"
  }
}

resource "google_container_registry" "gcr" {
  name = "zbgcr"
  location = "us"
  }

output "kubeconfig" {
  value = google_container_cluster.my_cluster.kubeconfig[0].raw_config
}
