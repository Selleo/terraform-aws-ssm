data "aws_caller_identity" "current" {
}

data "aws_region" "current" {
}

resource "random_id" "this" {
  byte_length = 6
}

resource "aws_iam_group" "access_parameters" {
  name = "ssm-access${replace(local.path, "/", "-")}-${random_id.this.hex}"
}

resource "aws_iam_group_policy_attachment" "access_parameters" {
  group      = aws_iam_group.access_parameters.name
  policy_arn = aws_iam_policy.access_parameters_group.arn
}

resource "aws_iam_policy" "access_parameters_group" {
  name   = "ssm-access${replace(local.path, "/", "-")}-${random_id.this.hex}"
  policy = data.aws_iam_policy_document.access_parameters.json
}

data "aws_iam_policy_document" "access_parameters" {
  statement {
    effect = "Allow"
    actions = [
      "ssm:PutParameter",
      "ssm:DeleteParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:DeleteParameters"
    ]
    resources = ["arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter${var.path}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ssm:DescribeParameters"
    ]
    resources = ["*"]
  }
}
