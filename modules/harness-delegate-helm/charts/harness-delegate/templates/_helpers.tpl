{{/*
Expand the name of the chart.
*/}}
{{- define "harness-delegate.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "harness-delegate.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}-{{ include "harness-delegate.accountIdShort" .}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}-{{ include "harness-delegate.accountIdShort" .}}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}-{{ include "harness-delegate.accountIdShort" .}}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "harness-delegate.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "harness-delegate.labels" -}}
helm.sh/chart: {{ include "harness-delegate.chart" . }}
harness.io/app: harness-delegate
harness.io/account: {{ include "harness-delegate.accountIdShort" . }}
harness.io/name: {{ include "harness-delegate.name" . }}
{{ include "harness-delegate.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "harness-delegate.selectorLabels" -}}
app.kubernetes.io/name: {{ include "harness-delegate.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "harness-delegate.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "harness-delegate.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "harness-delegate.accountIdShort" -}}
{{ regexReplaceAll "[0-9]" .Values.accountId "" | lower | trunc 5 }}
{{- end }}
