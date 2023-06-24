locals {
  path = var.path == "" ? "/${var.context.namespace}/${var.context.stage}/${var.context.name}/terraform" : var.path
  editable_path = var.editable_path == "" ? "/${var.context.namespace}/${var.context.stage}/${var.context.name}/editable" : var.editable_path
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
    "editor.readonly"     = "true"
    "editor.input"        = "text"
  }
}

resource "aws_ssm_parameter" "this_editable" {
  for_each = var.editable_secrets

  name        = "${local.editable_path}/${each.key}"
  description = "${each.key} secret that can be edited via UI"
  type        = "SecureString"
  value       = each.value

  tags = {
    "terraform.module"    = "Selleo/terraform-aws-ssm"
    "terraform.submodule" = "parameters"
    "context.namespace"   = var.context.namespace
    "context.stage"       = var.context.stage
    "context.name"        = var.context.name
    "editor.path"         = local.editable_path
    "editor.readonly"     = "false"
    "editor.input"        = "text"
  }

  lifecycle {
    ignore_changes = [value]
  }
}
