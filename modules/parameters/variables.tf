variable "context" {
  description = "Project context"

  type = object({
    namespace = string
    stage     = string
    name      = string
  })
}

variable "secrets" {
  description = "Key-value map of secrets. That can only be edited via Terraform."

  type    = map(string)
  default = {}
}

variable "editable_secrets" {
  description = "Key-value map of secrets that can be edited via UI"

  type    = map(string)
  default = {}
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
