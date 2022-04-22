# Helm Delegate Install

This module will install the Harness delegate into a Kubernetes cluster.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.5.1 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.5.1 |
| <a name="provider_utils"></a> [utils](#provider\_utils) | 0.17.21 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.delegate](https://registry.terraform.io/providers/hashicorp/helm/2.5.1/docs/resources/release) | resource |
| [utils_deep_merge_yaml.irsa](https://registry.terraform.io/providers/cloudposse/utils/latest/docs/data-sources/deep_merge_yaml) | data source |
| [utils_deep_merge_yaml.values](https://registry.terraform.io/providers/cloudposse/utils/latest/docs/data-sources/deep_merge_yaml) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The account ID to use for the Harness delegate. | `string` | n/a | yes |
| <a name="input_account_secret"></a> [account\_secret](#input\_account\_secret) | The account secret to use for the Harness delegate. | `string` | n/a | yes |
| <a name="input_delegate_name"></a> [delegate\_name](#input\_delegate\_name) | The name of the Harness delegate. | `string` | `"harness-delegate"` | no |
| <a name="input_delegate_profile"></a> [delegate\_profile](#input\_delegate\_profile) | The ID of the delegate profile to use. | `string` | n/a | yes |
| <a name="input_helm_repository"></a> [helm\_repository](#input\_helm\_repository) | The Helm repository to use. | `string` | `""` | no |
| <a name="input_irsa_enabled"></a> [irsa\_enabled](#input\_irsa\_enabled) | Whether to enable IRSA for the Harness delegate. | `bool` | `false` | no |
| <a name="input_irsa_role_arn"></a> [irsa\_role\_arn](#input\_irsa\_role\_arn) | The ARN of the role to use for IRSA for the Harness delegate. | `string` | `""` | no |
| <a name="input_kubernetes_host"></a> [kubernetes\_host](#input\_kubernetes\_host) | The hostname of the Kubernetes API. | `string` | n/a | yes |
| <a name="input_kubernetes_token"></a> [kubernetes\_token](#input\_kubernetes\_token) | The service account token to authentication to the Kubernetes API. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to deploy the Harness delegate to. | `string` | `"harness-delegate"` | no |
| <a name="input_proxy_password"></a> [proxy\_password](#input\_proxy\_password) | The proxy password to use for the Harness delegate. | `string` | `""` | no |
| <a name="input_proxy_user"></a> [proxy\_user](#input\_proxy\_user) | The proxy user to use for the Harness delegate. | `string` | `""` | no |
| <a name="input_values"></a> [values](#input\_values) | Additional values to pass to the helm chart. Values will be merged, in order, as Helm does with multiple -f options | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_values"></a> [values](#output\_values) | n/a |
