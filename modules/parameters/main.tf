locals {
  path = var.path == "" ? "/${var.context.namespace}/${var.context.stage}/${var.context.name}" : var.path
}

resource "aws_ssm_parameter" "this" {
  for_each = var.secrets

  name        = "${local.path}/${each.key}"
  description = "${each.key} secret"
  type        = "SecureString"
  value       = each.value

  tags = {
    "terraform.module"    = "Selleo/terraform-aws-ssm"
    "terraform.submodule" = "parameters"
    "context.namespace"   = var.context.namespace
    "context.stage"       = var.context.stage
    "context.name"        = var.context.name
    "editor.path"         = local.path
    "editor.readonly"     = tostring(var.readonly)
    "editor.input"        = "text"
  }
}
