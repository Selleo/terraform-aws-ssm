resource "aws_ssm_document" "session" {
  name          = var.name
  document_type = "Session"

  content = jsonencode({
    schemaVersion = "1.0"
    sessionType   = "Standard_Stream"
    description   = "Document to hold regional settings for Session Manager"
    inputs = {
      s3BucketName                = var.s3.bucket
      s3KeyPrefix                 = var.s3.prefix
      s3EncryptionEnabled         = true
      cloudWatchLogGroupName      = var.log_group_name
      cloudWatchEncryptionEnabled = true
      idleSessionTimeout          = var.idle_session_timeout
      maxSessionDuration          = var.max_session_duration
      cloudWatchStreamingEnabled  = false
      kmsKeyId                    = var.kms_arn
      runAsEnabled                = true
      runAsDefaultUser            = "ec2-user"
      shellProfile = {
        linux = ""
      }
    }
  })
}
