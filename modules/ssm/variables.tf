variable "name" {
  type        = string
  description = "SSM document name"
}

variable "kms_arn" {
  type        = string
  description = "KMS arn for session encryption"
}

# optional

variable "log_group_name" {
  type        = string
  description = "CloudWatch log group name for storing logs"
  default     = ""
}

variable "s3" {
  description = "S3 configuration to store logs"
  type = object({
    bucket = string
    prefix = string
  })
  default = {
    bucket = ""
    prefix = ""
  }
}

variable "idle_session_timeout" {
  type        = string
  description = "Idle session timeout"
  default     = "20"
}

variable "max_session_duration" {
  type        = string
  description = "Max session duration"
  default     = ""
}
