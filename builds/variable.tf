variable "commit_hash" {
  description = "Commit hash used to tag resources"
  type        = string
  default     = ""
}

variable "build_number" {
  description = "Jenkins build number."
  type        = string
  default     = ""
}