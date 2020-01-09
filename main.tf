terraform {
  required_version = ">= 0.12.18"

  required_providers {
    http = ">= 1.1.1"
  }
}

data http ip_address {
  url             = var.get_address_url
  request_headers = var.get_address_request_headers
}
