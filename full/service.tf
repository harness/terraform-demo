resource "harness_service_kubernetes" "nginx" {
  app_id       = harness_application.demo.id
  name         = "nginx"
  helm_version = "V3"
}

resource "harness_yaml_config" "nginx_artifact_source" {
  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Services/${harness_service_kubernetes.nginx.name}/Artifact Servers/library_nginx.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: DOCKER
imageName: library/nginx
serverName: docker-hub-public
EOF
}

resource "harness_yaml_config" "nginx_manifest" {
  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Services/${harness_service_kubernetes.nginx.name}/Manifests/Index.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: APPLICATION_MANIFEST
gitFileConfig:
  branch: main
  connectorName: ${harness_git_connector.demo.name}
  filePath: charts/nginx
  useBranch: true
  useInlineServiceDefinition: false
storeType: HelmSourceRepo
EOF
}

resource "harness_yaml_config" "nginx_values_index" {
  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Services/${harness_service_kubernetes.nginx.name}/Values/Index.yaml"
  content = <<EOF
harnessApiVersion: '1.0'
type: APPLICATION_MANIFEST
storeType: Local
EOF
}

resource "harness_yaml_config" "nginx_values" {
  depends_on = [
    harness_yaml_config.nginx_values_index,
  ]

  app_id  = harness_application.demo.id
  path    = "Setup/Applications/${harness_application.demo.name}/Services/${harness_service_kubernetes.nginx.name}/Values/values.yaml"
  content = <<EOF
image.tag: "$${artifact.metadata.tag}" 
EOF
}
