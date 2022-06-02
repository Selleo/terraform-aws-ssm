output "secrets" {
  description = "Store Parameters as Name-ARN map"

  value = {
    for k, param in aws_ssm_parameter.this : k => param.arn
  }
}
