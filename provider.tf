terraform {
  required_providers {
    harness = {
      source = "harness-io/harness"
      version = "0.0.9"
    }
  }
}

provider "harness" {
  # Configuration options
  # For this demo the configuration is set through environment variables
}
