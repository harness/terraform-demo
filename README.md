# Terraform Demo



## Variables

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `github_username` | The github username used for the git connector. | |
| `github_token` | The github token for used for the git connector. | |
| `application_name` | The name of the Harness application to be created. | `Harness Terraform Demo` |
| `repository_url` | The url of the git repository. This is where the Kubernetes manifest will be located | `https://github.com/harness-io/terraform-demo`
| `repository_branch` | The branch of the repository to use for the git connector. | `main` |
