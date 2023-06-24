variable "context" {
  description = "Project context"

  type = object({
    namespace = string
    stage     = string
    name      = string
  })
}

variable "path" {
  description = "Parameter store path for all secrets. If empty then defaults to `/$namespace/$stage/$name/terraform`."
  type        = string
  default     = ""
}

variable "editable_path" {
  description = "Parameter store path for all editable secrets. If empty then defaults to `/$namespace/$stage/$name/editable."
  type        = string
  default     = ""
}
