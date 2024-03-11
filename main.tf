provider "google" {
  credentials = file("$GCP_SA_KEY")
  project = "$GCP_PROJECT_ID"
  region = "us-central1"
}

resource "google_storage_bucket" "terraform_state" {
  name = "zb-poc-bucket"
  location = "us"
}

resource "google_container_cluster" "my_cluster" {
  name = "zb-gke"
  location = "us-central1"

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