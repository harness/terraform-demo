resource "harness_environment" "dev" {
  app_id = harness_application.demo.id
  name   = "dev"
  type   = "NON_PROD"
}

resource "harness_infrastructure_definition" "k8s_dev" {
  name                = "k8s-dev"
  app_id              = harness_application.demo.id
  env_id              = harness_environment.dev.id
  cloud_provider_type = "KUBERNETES_CLUSTER"
  deployment_type     = "KUBERNETES"

  kubernetes {
    cloud_provider_name = harness_cloudprovider_kubernetes.demo.name
    namespace           = harness_environment.dev.name
    release_name        = "$${service.name}"
  }
}

resource "harness_environment" "stage" {
  app_id = harness_application.demo.id
  name   = "stage"
  type   = "NON_PROD"
}

resource "harness_infrastructure_definition" "k8s_stage" {
  name                = "k8s-stage"
  app_id              = harness_application.demo.id
  env_id              = harness_environment.stage.id
  cloud_provider_type = "KUBERNETES_CLUSTER"
  deployment_type     = "KUBERNETES"

  kubernetes {
    cloud_provider_name = harness_cloudprovider_kubernetes.demo.name
    namespace           = harness_environment.stage.name
    release_name        = "$${service.name}"
  }
}

resource "harness_environment" "prod" {
  app_id = harness_application.demo.id
  name   = "prod"
  type   = "PROD"
}

resource "harness_infrastructure_definition" "k8s_prod" {
  name                = "k8s-prod"
  app_id              = harness_application.demo.id
  env_id              = harness_environment.prod.id
  cloud_provider_type = "KUBERNETES_CLUSTER"
  deployment_type     = "KUBERNETES"

  kubernetes {
    cloud_provider_name = harness_cloudprovider_kubernetes.demo.name
    namespace           = harness_environment.prod.name
    release_name        = "$${service.name}"
  }
}

