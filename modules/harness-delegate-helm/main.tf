resource "helm_release" "delegate" {
  name             = var.delegate_name
  repository       = coalesce(var.helm_repository, "${path.module}/charts")
  chart            = "harness-delegate"
  namespace        = var.namespace
  create_namespace = true

  values = [data.utils_deep_merge_yaml.values.output]
}

locals {
  values = yamlencode({
    accountId       = var.account_id,
    accountSecret   = var.account_secret,
    delegateProfile = var.delegate_profile
    proxyUser       = var.proxy_user
    proxyPassword   = var.proxy_password
  })
}


data "utils_deep_merge_yaml" "values" {
  input = compact([
    local.values,
    var.irsa_enabled ? data.utils_deep_merge_yaml.irsa[0].output : "",
    var.values
  ])
}

data "utils_deep_merge_yaml" "irsa" {
  count = var.irsa_enabled ? 1 : 0
  input = compact([
    yamlencode({
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : var.irsa_role_arn,
        }
      }
    })
  ])
}

output "values" {
  value = data.utils_deep_merge_yaml.values.output
  // sensitive = false
}
