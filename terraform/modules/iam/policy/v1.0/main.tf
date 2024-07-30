resource "aws_iam_policy" "policy" {
  name        = format("%s-%s", var.prefix, var.name)
  path        = var.path
  description = var.description
  policy      = var.policy
  tags        = var.tags
}
