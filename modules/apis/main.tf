resource "google_project_service" "project_apis" {
  for_each = var.project_apis
  project  = var.project_id
  service  = each.key
}
