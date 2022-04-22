variable "helm_repository" {
  description = "The Helm repository to use."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The namespace to deploy the Harness delegate to."
  type        = string
  default     = "harness-delegate"
}

variable "delegate_name" {
  description = "The name of the Harness delegate."
  type        = string
  default     = "harness-delegate"
}

variable "account_id" {
  description = "The account ID to use for the Harness delegate."
  type        = string
}

variable "account_secret" {
  description = "The account secret to use for the Harness delegate."
  type        = string
  // sensitive = true
}

variable "delegate_profile" {
  description = "The ID of the delegate profile to use."
  type        = string
}

variable "proxy_user" {
  description = "The proxy user to use for the Harness delegate."
  type        = string
  // sensitive = true
  default = ""
}

variable "proxy_password" {
  description = "The proxy password to use for the Harness delegate."
  type        = string
  // sensitive = true
  default = ""
}

variable "irsa_enabled" {
  description = "Whether to enable IRSA for the Harness delegate."
  type        = bool
  default     = false
}

variable "irsa_role_arn" {
  description = "The ARN of the role to use for IRSA for the Harness delegate."
  type        = string
  default     = ""
}

variable "values" {
  description = "Additional values to pass to the helm chart. Values will be merged, in order, as Helm does with multiple -f options"
  type        = string
  default     = ""
}
