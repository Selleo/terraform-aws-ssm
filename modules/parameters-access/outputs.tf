output "group" {
  description = "Store parameter accsess group (use group or policy, not both)."
  value = {
    arn  = aws_iam_group.this.arn
    name = aws_iam_group.this.name
  }
}

output "policy_arn" {
  description = "Store parameter accsess policy (use group or policy, not both)."
  value       = aws_iam_policy.this.arn
}
