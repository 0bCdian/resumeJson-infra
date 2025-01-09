terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.15.0"
    }
  }
  backend "gcs" {
    bucket = "resumejson-staging-opentofu"
    prefix = "tofu/state"
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

