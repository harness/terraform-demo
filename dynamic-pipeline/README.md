# Dynamic Pipeline Example

This module will dynamically generate a pipeline based on a list of services passed into it.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harness"></a> [harness](#provider\_harness) | 0.2.2 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harness_yaml_config.auto_pipeline](https://registry.terraform.io/providers/harness/harness/latest/docs/resources/yaml_config) | resource |
| [harness_application.demo](https://registry.terraform.io/providers/harness/harness/latest/docs/data-sources/application) | data source |
| [template_file.pipeline](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.stage](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | n/a | `string` | `"The name of the Harness Application to create the pipeline for."` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"The name of the environment to deploy to."` | no |
| <a name="input_infradef"></a> [infradef](#input\_infradef) | n/a | `string` | `"The name of the infrastructure definition to use."` | no |
| <a name="input_release_id"></a> [release\_id](#input\_release\_id) | A unique identifier for the release. | `any` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | A list of services to be deployed. | `list(string)` | n/a | yes |
| <a name="input_workflow_name"></a> [workflow\_name](#input\_workflow\_name) | The name of the workflow to use for each stage of the deployment. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stage"></a> [stage](#output\_stage) | n/a |
