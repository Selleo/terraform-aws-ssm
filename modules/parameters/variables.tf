variable "secrets" {
  description = "Key-value map of secrets"

  type    = map(string)
  default = {}
}

variable "context" {
  description = "Project context"

  type = object({
    namespace = string
    stage     = string
    name      = string
  })
}

variable "readonly" {
  description = "Indicates whether secrets are dispalyed as read-only in the custom editor"

  type    = bool
  default = false
}

variable "path" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = ""
}
