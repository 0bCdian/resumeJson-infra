resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region_name

  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
