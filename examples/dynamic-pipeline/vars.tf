
variable "release_id" {
  description = "A unique identifier for the release."
}

variable "application_name" {
  default = "The name of the Harness Application to create the pipeline for."
}

variable "infradef" {
  default = "The name of the infrastructure definition to use."
}

variable "environment" {
  default = "The name of the environment to deploy to."
}

variable "workflow_name" {
  description = "The name of the workflow to use for each stage of the deployment."
}

variable "services" {
  description = "A list of services to be deployed."
  type = list(string)
}

variable "pipeline_prefix" {
  description = "The prefix to use for the pipeline name."
  default = "release"
}
