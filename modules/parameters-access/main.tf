locals {
  path          = var.path == "" ? "/${var.context.namespace}/${var.context.stage}/${var.context.name}/terraform" : var.path
  editable_path = var.editable_path == "" ? "/${var.context.namespace}/${var.context.stage}/${var.context.name}/editable" : var.editable_path
  iam_name      = "parameters-access-${random_id.this.hex}"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "random_id" "this" {
  byte_length = 6
}

resource "aws_iam_group" "this" {
  name = local.iam_name
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_policy" "this" {
  name        = local.iam_name
  policy      = data.aws_iam_policy_document.this.json
  description = "Allow access to SSM parameters. Allows to read all parameters in the path (${local.path}). Allows to update all parameters in the editable_path (${local.editable_path})."
}

data "aws_iam_policy_document" "this" {
  statement {
    sid    = "AllowReadAccess"
    effect = "Allow"
    actions = [
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
    ]
    resources = [
      "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter${local.path}/*",
      "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter${local.editable_path}/*",
    ]
  }

  statement {
    sid    = "AllowWriteAccess"
    effect = "Allow"
    actions = [
      "ssm:PutParameter",
      #
      # We don't want to allow deletion of parameters, only updates by user
      # deletion should be done by terraform
      #
      # "ssm:DeleteParameter",
      # "ssm:DeleteParameters"
    ]
    resources = ["arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter${local.editable_path}/*"]
  }

  statement {
    sid    = "AllowDescribeParameters"
    effect = "Allow"
    actions = [
      "ssm:DescribeParameters"
    ]
    resources = ["*"]
  }
}
