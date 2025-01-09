resource "google_firestore_database" "firestore_database" {
  project         = var.project_id
  name            = var.db_name
  location_id     = "nam5"
  type            = "FIRESTORE_NATIVE"
  deletion_policy = "DELETE"
}
