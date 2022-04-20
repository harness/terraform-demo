# Terraform Demo

This project serves as an example of how to spin up a new project in Harness CD using the [Harness Terraform Provider](https://github.com/harness-io/terraform-provider-harness). This can be used as a starting point for onboarding a new team onto the platform.

When you apply this module you will have

- A new application with a fully functioning pipeline that will deploy an nginx service to `dev`, `stage`, and `prod` environments.
- A developer and administrator user group for the application.

## Disclaimer

This product is not supported by the Harness Customer support team. If you have any questions please open a [new issue](https://github.com/harness-io/terraform-demo/issues/new) or join our slack [channel](https://harnesscommunity.slack.com/archives/C02G9CUNF1S).

## Pre-requisites

- **Delegate**: You will need a delegate running in a Kubernetes cluster with a selector of `k8s`. 
- **Namespaces**: You will need to create the following namespaces in the cluster if you want to run the example pipeline that is created: `dev`, `stage`, `prod`. 
- **API Key**: You will need to create an api key by following [these instructions](https://docs.harness.io/article/smloyragsm-api-keys). For this example it should have the role of `Account Administrator`. You will need to set this using the environment variable `HARNESS_API_KEY`.
- **Account Id**: This can be found in the URL of the Harness UI. The format is `https://app.harness.io/#/account/<ACCOUNT_ID>`. You will need to se this using the environment variable `HARNESS_ACCOUNT_ID`.


## Variables

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `application_name` | The name of the Harness application to be created. | `Harness Terraform Demo` |
| `github_token` | The github token for used for the git connector. | |
| `github_username` | The github username used for the git connector. | |
| `prefix` | A prefix to use to ensure account level settings are unique (i.e. cloud providers, secrets, connectors, etc.). | `demo` |
| `repository_branch` | The branch of the repository to use for the git connector. | `main` |
| `repository_url` | The url of the git repository. This is where the Kubernetes manifest will be located | `https://github.com/harness-io/terraform-demo`
