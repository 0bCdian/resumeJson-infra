variable "project_id" {
  type        = string
  description = "gcp project_id"
}

variable "project_apis" {
  type        = list(string)
  description = "Array of apis to activate in a project"

}
