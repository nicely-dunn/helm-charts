{{/*
Expand the name of the chart.
*/}}
{{- define "joplin-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "joplin-server.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "joplin-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "joplin-server.labels" -}}
helm.sh/chart: {{ include "joplin-server.chart" . }}
{{ include "joplin-server.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "joplin-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "joplin-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "joplin-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "joplin-server.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Ensure either Postgres credentials are set in-chart or in a secret
*/}}
{{- if not (or .Values.postgresSecret (and .Values.config.POSTGRES_PASSWORD .Values.config.POSTGRES_USER)) }}
{{- fail "You must set either 'postgresSecret' or both 'config.POSTGRES_USER' and 'config.POSTGRES_PASSWORD' in values.yaml" }}
{{- end }}

