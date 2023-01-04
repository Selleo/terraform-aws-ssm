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

variable "path" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = ""
}
