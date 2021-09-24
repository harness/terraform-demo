resource "harness_cloudprovider_kubernetes" "demo" {
  name = "Kubernetes Demo"

  authentication {
    delegate_selectors = ["k8s"]
  }

  usage_scope {
    application_filter_type = "ALL"
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }
  
  usage_scope {
    application_filter_type = "ALL"
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }
}
