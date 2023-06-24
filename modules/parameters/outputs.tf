output "secrets" {
  description = "Store Parameters as Name-ARN map"

  value = {
    for k, param in aws_ssm_parameter.this : k => param.arn
  }
}

output "editable_secrets" {
  description = "Store Parameters as Name-ARN map"

  value = {
    for k, param in aws_ssm_parameter.this_editable : k => param.arn
  }
}
