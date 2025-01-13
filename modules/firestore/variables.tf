variable "project_id" {
  type        = string
  description = "gcp project_id"
}
variable "db_name" {
  type        = string
  description = "Name for the firestore instance, default is (default)"
  default     = "(default)"
}

variable "location_id" {
  type        = string
  description = "Location of the region for the firstore instance"
  default     = "nam5"
}
