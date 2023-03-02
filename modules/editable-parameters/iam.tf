data "aws_caller_identity" "current" {
}

resource "aws_iam_group" "access_parameters" {
  name = "ssm-access-parameters"
}

resource "aws_iam_group_policy_attachment" "access_parameters" {
  group      = aws_iam_group.access_parameters.name
  policy_arn = aws_iam_policy.access_parameters_group.arn
}

resource "aws_iam_policy" "access_parameters_group" {
  name   = "ssm-access-parameters"
  policy = data.aws_iam_policy_document.access_parameters.json
}

data "aws_iam_policy_document" "access_parameters" {
  statement {
    effect = "Allow"
    actions = [
      "ssm:ListTagsForResource",
      "ssm:GetParameters",
      "ssm:PutParameter"
    ]
    resources = ["arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter${var.path}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
        "ssm:DescribeParameters"
    ]
    resources = ["*"]
  }
}
