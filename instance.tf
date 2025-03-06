# Sample Terraform Code for GCP Authentication

# Define Provider
provider "google" {
  project     = var.project
  region      = var.region
  credentials = var.gcp_credentials
}

# Variables
variable "project" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "gcp_credentials" {
  description = "GCP Credentials JSON"
  type        = string
  sensitive   = true
}

# Example Resource (VM Instance)
resource "google_compute_instance" "default" {
  name         = "tf-dev-vm"
  machine_type = "e2-medium"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Outputs
output "instance_ip" {
  description = "Public IP of the instance"
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}
