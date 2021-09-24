variable "github_username" {
  description = "The github username used for the git connector"
}

variable "github_token" {
  description = "The github token for used for the git connector."
}

variable "application_name" {
  description = "The name of the Harness application to be created."
  default = "Harness Terraform Demo"
}
