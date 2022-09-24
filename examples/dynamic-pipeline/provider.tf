terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

# Keep one of the below provider configurations based on your version of Harness
# Reference: https://registry.terraform.io/providers/harness/harness/latest/docs
# Harness First Gen resources
provider "harness" {
  endpoint   = "https://app.harness.io/gateway"
  account_id = "...."
  api_key    = "......"
}

# Harness Next Gen resources
provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = "...."
  platform_api_key = "......"
}
