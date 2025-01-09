resource "google_artifact_registry_repository" "docker-repo" {
  location      = var.region
  repository_id = var.repository-id
  description   = var.description
  format        = "DOCKER"
}
