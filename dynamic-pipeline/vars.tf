
variable "release_id" {}

variable "application_name" {}

variable "infradef" {
  default = "k8s"
}

variable "environment" {
  default = "dev"
}

variable "workflow_name" {
  default = "rolling"
}

variable "services" {
  default = [
    "nginx1",
    "nginx2",
    "nginx3",
  ]
}
