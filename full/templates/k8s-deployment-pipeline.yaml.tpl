harnessApiVersion: '1.0'
type: PIPELINE
pipelineStages:
- type: ENV_STATE
  name: k8s-rolling-deployment
  parallel: false
  skipCondition:
    type: DO_NOT_SKIP
  stageName: Dev
  workflowName: k8s-rolling-deployment
  workflowVariables:
  - entityType: INFRASTRUCTURE_DEFINITION
    name: InfraDefinition
    value: ${dev_infra_name}
  - entityType: ENVIRONMENT
    name: Environment
    value: dev
  - entityType: SERVICE
    name: Service
    value: $${Service}
- type: ENV_STATE
  name: k8s-rolling-deployment-1
  parallel: false
  skipCondition:
    type: DO_NOT_SKIP
  stageName: Stage
  workflowName: k8s-rolling-deployment
  workflowVariables:
  - entityType: INFRASTRUCTURE_DEFINITION
    name: InfraDefinition
    value: ${stage_infra_name}
  - entityType: ENVIRONMENT
    name: Environment
    value: stage
  - entityType: SERVICE
    name: Service
    value: $${Service}
- type: APPROVAL
  name: Approval 2
  parallel: false
  properties:
    userGroups:
    - Account Administrator
    variables: null
    stageName: Prod Approval
    timeoutMillis: 86400000
    approvalStateType: USER_GROUP
    sweepingOutputName: ''
  skipCondition:
    type: DO_NOT_SKIP
  stageName: Prod Approval
- type: ENV_STATE
  name: k8s-canary-deployment
  parallel: false
  skipCondition:
    type: DO_NOT_SKIP
  stageName: Prod
  workflowName: k8s-canary-deployment
  workflowVariables:
  - entityType: INFRASTRUCTURE_DEFINITION
    name: InfraDefinition
    value: ${prod_infra_name}
  - entityType: ENVIRONMENT
    name: Environment
    value: prod
  - entityType: SERVICE
    name: Service
    value: $${Service}
