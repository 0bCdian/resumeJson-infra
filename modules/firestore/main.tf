resource "google_firestore_database" "firestore_database" {
  project         = var.project_id
  name            = var.db_name
  location_id     = var.location_id
  type            = "FIRESTORE_NATIVE"
  deletion_policy = "DELETE"
}
