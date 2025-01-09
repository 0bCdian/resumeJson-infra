locals {
  project_apis             = jsondecode(file("${path.module}/apis.json"))
  project_service_accounts = jsondecode(file("${path.module}/service-accounts.json"))
}

module "project_apis" {
  source       = "../modules/apis"
  project_id   = var.project_id
  project_apis = local.project_apis
}

module "service-accounts" {
  count           = length(local.project_service_accounts)
  source          = "../modules/service-accounts"
  project_id      = var.project_id
  service_account = local.project_service_accounts[count.index]
}

module "firestore" {
  source     = "../modules/firestore"
  project_id = var.project_id
  db_name    = "(default)"
}

module "cloud-storage" {
  source      = "../modules/cloud-storage"
  bucket_name = "error-reports"
  region_name = var.region
}

module "artifact-registry" {
  source        = "../modules/artifact-registry"
  repository-id = "resumejson-staging"
  region        = var.region
  description   = "main docker registry for apps in the resumejson staging project"
}

// I forgot I had a module for this the first time 
resource "google_storage_bucket" "state" {
  name          = "resumejson-staging-opentofu"
  location      = var.region
  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

