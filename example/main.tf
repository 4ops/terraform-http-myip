terraform {
  required_version = ">= 0.12.18"

  required_providers {
    aws = ">= 2.43"
  }
}

module myip {
  source = "../"
  # source  = "4ops/myip/http"
  # version = "1.1.0"
}

resource aws_security_group allow_ssh {
  name        = "allow_ssh"
  description = "Allow SSH inbound connections"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = concat(compact(var.trusted_hosts), [module.myip.address])
  }
}
