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
}

resource "google_compute_network" "vpc_network" {
  name = "tf-dev-net"
}
