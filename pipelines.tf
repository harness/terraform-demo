resource "harness_yaml_config" "k8s_rolling_workflow" {
  app_id = harness_application.demo.id
  path = "Setup/Applications/${harness_application.demo.name}/Workflows/k8s-rolling-deployment.yaml"
  content = file("${path.module}/templates/k8s-rolling-workflow.yaml")
}

resource "harness_yaml_config" "k8s_canary_workflow" {
  app_id = harness_application.demo.id
  path = "Setup/Applications/${harness_application.demo.name}/Workflows/k8s-canary-deployment.yaml"
  content = file("${path.module}/templates/k8s-canary-workflow.yaml")
}

resource "harness_yaml_config" "k8s_pipeline" {
  // Our pipeline deploys to multiple environments/infras 
  // so we need to make sure they're created beforehand

  depends_on = [
    harness_infrastructure_definition.k8s_dev,
    harness_infrastructure_definition.k8s_stage,
    harness_infrastructure_definition.k8s_prod,
  ]

  app_id = harness_application.demo.id
  path = "Setup/Applications/${harness_application.demo.name}/Pipelines/k8s-deployment.yaml"
  content = file("${path.module}/templates/k8s-deployment-pipeline.yaml")
}
