output "secrets" {
  description = "Store Parameters as Name-ARN map"

  value = {
    for k, param in aws_ssm_parameter.this : k => param.arn
  }
}

output "ssm_access_group" {
  description = "SSM Access group data."
  value = {
    arn  = aws_iam_group.access_parameters_group.arn
    name = aws_iam_group.access_parameters_group.name
  }
}
