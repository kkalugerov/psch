resource "aws_iam_role" "role" {
  name                 = format("%s-%s", var.prefix, var.role_name)
  path                 = var.role_path
  max_session_duration = var.max_session_duration
  description          = var.role_description

  permissions_boundary = var.role_permissions_boundary_arn

  assume_role_policy = var.role_requires_mfa ? data.aws_iam_policy_document.assume_role_with_mfa.json : var.principal == "AWS" ? data.aws_iam_policy_document.assume_role_principal_aws.json : data.aws_iam_policy_document.assume_role_principal_service.json

  tags = merge(
    {
      Name = format("%s-%s", var.prefix, var.role_name)
  }, var.tags)
}

resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  count = length(var.custom_role_policy_arns) > 0 ? length(var.custom_role_policy_arns) : 0

  role       = aws_iam_role.role.name
  policy_arn = element(var.custom_role_policy_arns, count.index)
}
