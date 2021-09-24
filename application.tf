resource "harness_application" "demo" {

  // This is a workaround for the race condition defined here https://harness.atlassian.net/browse/SWAT-5332
  // Any objects that have a usage_scope defined can potentially hit an error if the application is
  // in the process of being created.
  depends_on = [
    harness_cloudprovider_kubernetes.demo,
    harness_encrypted_text.github_token,
    harness_git_connector.demo
  ]

  name = var.application_name
}

