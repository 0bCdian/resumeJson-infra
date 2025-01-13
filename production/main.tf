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
  source      = "../modules/firestore"
  project_id  = var.project_id
  location_id = var.region
  db_name     = "(default)"
}

module "cloud-storage" {
  for_each    = toset(["test-reports-resume", "resumejson-opentofu"])
  source      = "../modules/cloud-storage"
  bucket_name = each.key
  region_name = var.region
}

module "artifact-registry" {
  source        = "../modules/artifact-registry"
  repository-id = "resumejson"
  region        = var.region
  description   = "main docker registry for apps in the resumejson staging project"
}
