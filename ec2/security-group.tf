resource "aws_security_group" "main" {

  lifecycle {
    create_before_destroy = true
  }

  description = "Sg with all ports open to egress."
  name        = "${var.resource_name_prefix}-sg-ec2-${var.ec2_name}"
  vpc_id      = var.vpc_id
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }
  tags = {
    Name             = "${var.resource_name_prefix}-sg-ec2-${var.ec2_name}"
    Description      = "Sg with all ports open to egress."
    "evtech:program" = var.program_tag
  }

}

resource "aws_security_group_rule" "main" {

  lifecycle {
    create_before_destroy = true
  }

  count                    = length(var.sg_rules)
  description              = try(var.sg_rules[count.index].description, null)
  cidr_blocks              = try(var.sg_rules[count.index].cidr_blocks, null)
  from_port                = try(var.sg_rules[count.index].from_port, null)
  protocol                 = try(var.sg_rules[count.index].protocol, null)
  self                     = try(var.sg_rules[count.index].self ? var.sg_rules[count.index].self : null, null)
  security_group_id        = aws_security_group.main.id
  source_security_group_id = try(var.sg_rules[count.index].source_security_group_id == "" ? null : var.sg_rules[count.index].source_security_group_id, null)
  to_port                  = try(var.sg_rules[count.index].to_port, null)
  type                     = try(var.sg_rules[count.index].type, null)
  prefix_list_ids          = try(var.sg_rules[count.index].prefix_list_ids, null)
  ipv6_cidr_blocks         = try(var.sg_rules[count.index].ipv6_cidr_blocks, null)

}
