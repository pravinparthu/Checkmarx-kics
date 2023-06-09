provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_network_acl" "negative2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl_rule" "negative2" {
  network_acl_id = aws_network_acl.negative2.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  from_port      = 3389
  to_port        = 3389
  cidr_block     = "10.3.0.0/18"
}
