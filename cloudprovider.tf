resource "harness_cloudprovider_kubernetes" "demo" {
  name = "${var.prefix}-kubernetes"

  authentication {
    delegate_selectors = ["k8s"]
  }

  usage_scope {
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }

  lifecycle {
    create_before_destroy = true
  }
}
