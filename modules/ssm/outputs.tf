output "arn" {
  description = "SSM document ARN"
  value       = aws_ssm_document.session.arn
}
