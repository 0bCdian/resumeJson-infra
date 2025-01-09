resource "google_project_service" "project_apis" {
  count   = length(var.project_apis)
  project = var.project_id
  service = var.project_apis[count.index]
}
