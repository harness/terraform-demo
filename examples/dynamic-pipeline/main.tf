data "template_file" "stage" {
  count = "${length(var.services)}"

  template = "${file("${path.module}/templates/stage.tmpl.yaml")}"

  vars = {
    serviceName = var.services[count.index]
    envName = var.environment
    infraName = var.infradef
    parallel = count.index != 0
    workflowName = var.workflow_name
  }
}

data "template_file" "pipeline" {

  template = "${file("${path.module}/templates/pipeline.tmpl.yaml")}"

  vars = {
    stages = join("\n", data.template_file.stage[*].rendered)
  }
}

data "harness_application" "demo" {
  name = var.application_name
}

resource "harness_yaml_config" "auto_pipeline" {
  app_id  = data.harness_application.demo.id
  path    = "Setup/Applications/${data.harness_application.demo.name}/Pipelines/release_${var.environment}_${var.release_id}.yaml"
  content = data.template_file.pipeline.rendered
}

