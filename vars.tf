variable "github_username" {
  description = "The github username used for the git connector."
}

variable "github_token" {
  description = "The github token for used for the git connector."
}

variable "application_name" {
  description = "The name of the Harness application to be created."
  default = "Harness Terraform Demo"
}

variable "repository_url" {
  description = "The url of the repository to be cloned."
  default = "https://github.com/harness-io/terraform-demo"
}

variable "repository_branch" {
  description = "The branch of the repository to use for the git connector."
  default = "main"
}
