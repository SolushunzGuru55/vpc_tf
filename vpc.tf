terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "solushunz-sap-poc"
  region  = "us-east4"
  zone    = "us-east4-b"
  credentials = var.gcp_credentials
}

variable "gcp_credentials" {
  description = "GCP Credentials JSON"
  type        = string
  sensitive   = true
}

resource "google_compute_network" "vpc_network" {
  name = "tf-dev-net"
}
