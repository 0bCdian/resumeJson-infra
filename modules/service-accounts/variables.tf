variable "service_account" {
  description = "Map of service account name to their roles"
  type        = object({ name = string, roles : list(string) })
}

variable "project_id" {
  type        = string
  description = "gcp project_id"
}
