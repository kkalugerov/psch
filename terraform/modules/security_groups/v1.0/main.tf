resource "aws_security_group" "this" {
  name        = format("%s-%s-%s-%s", var.prefix, var.region, var.usage, "sg")
  vpc_id      = var.vpc_id
  description = var.description

  tags = merge(
    {
      "Name" = format("%s-%s-%s-%s", var.prefix, var.region, var.usage, "sg")
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {

  for_each = var.ingress_rules

  ip_protocol                  = lookup(each.value, "ip_protocol", null)
  from_port                    = lookup(each.value, "from_port", null)
  to_port                      = lookup(each.value, "to_port", null)
  cidr_ipv4                    = lookup(each.value, "cidr_ipv4", null)
  cidr_ipv6                    = lookup(each.value, "cidr_ipv6", null)
  referenced_security_group_id = lookup(each.value, "referenced_security_group_id", null)
  prefix_list_id               = lookup(each.value, "prefix_list_ids", null)
  description                  = lookup(each.value, "description", null)

  security_group_id = aws_security_group.this.id
}

resource "aws_vpc_security_group_egress_rule" "egress_rules" {

  for_each = var.egress_rules

  ip_protocol                  = lookup(each.value, "ip_protocol", null)
  from_port                    = lookup(each.value, "from_port", null)
  to_port                      = lookup(each.value, "to_port", null)
  cidr_ipv4                    = lookup(each.value, "cidr_ipv4", null)
  cidr_ipv6                    = lookup(each.value, "cidr_ipv6", null)
  referenced_security_group_id = lookup(each.value, "referenced_security_group_id", null)
  prefix_list_id               = lookup(each.value, "prefix_list_ids", null)
  description                  = lookup(each.value, "description", null)

  security_group_id = aws_security_group.this.id
}
