resource "google_service_account" "service_account" {

  account_id   = var.service_account.name
  display_name = "Service account for ${var.service_account.name}"
}


resource "google_project_iam_member" "service_account_roles" {
  count   = length(var.service_account.roles)
  project = var.project_id
  role    = var.service_account.roles[count.index]
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
