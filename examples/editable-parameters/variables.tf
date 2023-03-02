variable "path" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Namespace of the project."
  type        = string
  default     = "namespace"
}

variable "stage" {
  description = "Name of stage in project"
  type        = string
  default     = "stage"
}

variable "name" {
  description = "no idea how to describe that"
  type        = string
  default     = "name"
}
