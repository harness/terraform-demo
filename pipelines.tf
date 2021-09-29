resource "harness_yaml_config" "k8s_rolling_workflow" {
  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Workflows/k8s-rolling-deployment.yaml"
  content = file("${path.module}/templates/k8s-rolling-workflow.yaml")
}

resource "harness_yaml_config" "k8s_canary_workflow" {
  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Workflows/k8s-canary-deployment.yaml"
  content = file("${path.module}/templates/k8s-canary-workflow.yaml")
}


data "template_file" "k8s_pipeline" {
  template = file("${path.module}/templates/k8s-deployment-pipeline.yaml.tpl")
  vars = {
    dev_infra_name   = harness_infrastructure_definition.k8s_dev.name
    stage_infra_name = harness_infrastructure_definition.k8s_stage.name
    prod_infra_name  = harness_infrastructure_definition.k8s_prod.name
  }
}

resource "harness_yaml_config" "k8s_pipeline" {
  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Pipelines/k8s-deployment.yaml"
  content = data.template_file.k8s_pipeline.rendered
}
