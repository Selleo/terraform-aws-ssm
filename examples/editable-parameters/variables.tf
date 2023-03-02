variable "path" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = "test"
}

variable "stage" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = "test"
}

variable "name" {
  description = "Parameter store path for all secrets. If empty then defaults to /namespace/stage/name."
  type        = string
  default     = "test"
}
