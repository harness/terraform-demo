data "harness_secret_manager" "default" {
  default = true
}

resource "harness_encrypted_text" "github_token" {
  name              = "${var.prefix}-github-token"
  value             = var.github_token
  secret_manager_id = data.harness_secret_manager.default.id

  usage_scope {
    application_filter_type = "ALL"
    environment_filter_type = "NON_PRODUCTION_ENVIRONMENTS"
  }

  usage_scope {
    application_filter_type = "ALL"
    environment_filter_type = "PRODUCTION_ENVIRONMENTS"
  }
}

resource "harness_git_connector" "demo" {
  name                 = "${var.prefix}-git-connector"
  url                  = var.repository_url
  branch               = var.repository_branch
  username             = var.github_username
  password_secret_id   = harness_encrypted_text.github_token.id
  url_type             = "REPO"
  generate_webhook_url = true
}

resource "harness_yaml_config" "docker_registry" {
  path    = "Setup/Artifact Servers/docker-hub-public.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: DOCKER
url: https://registry.hub.docker.com/v2/
usageRestrictions:
  appEnvRestrictions:
  - appFilter:
      filterType: ALL
    envFilter:
      filterTypes:
      - PROD
  - appFilter:
      filterType: ALL
    envFilter:
      filterTypes:
      - NON_PROD
EOF
}
