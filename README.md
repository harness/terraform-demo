# Terraform Demo

This project serves as an example of how to spin up a new project in Harness CD using the [Harness Terraform Provider](https://github.com/harness-io/terraform-provider-harness). This can be used as a starting point for onboarding a new team onto the platform.

When you apply this module you will have

- A new application with a fully functioning pipeline that will deploy an nginx service to `dev`, `stage`, and `prod` environments.
- A developer and administrator user group for the application.

## Pre-requisites

To run this example it is assumed that you already have a delegate running in a Kubernetes cluster with a selector of `k8s`. 

You will also need to create the following namespaces in the cluster if you want to run the example pipeline that is created: `dev`, `stage`, `prod`. 


## Variables

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `application_name` | The name of the Harness application to be created. | `Harness Terraform Demo` |
| `github_token` | The github token for used for the git connector. | |
| `github_username` | The github username used for the git connector. | |
| `prefix` | `A prefix to use to ensure account level settings are unique (i.e. cloud providers, secrets, connectors, etc.).` | `demo` |
| `repository_branch` | The branch of the repository to use for the git connector. | `main` |
| `repository_url` | The url of the git repository. This is where the Kubernetes manifest will be located | `https://github.com/harness-io/terraform-demo`
