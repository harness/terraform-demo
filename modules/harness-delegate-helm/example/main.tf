module "delegate" {
  source = "../."

  account_id = "ABC123"
  account_secret = "XYZ789"
  delegate_profile = "DEF456"
  delegate_name = "example"
  namespace = "foo"

  # Additional optional values to pass to the helm chart
  values = yamlencode({
    javaOpts: "-Xms64M" 
  })
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
