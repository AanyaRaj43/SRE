{{- define "metrics-app.name" -}}
metrics-app
{{- end }}

{{- define "metrics-app.fullname" -}}
{{ include "metrics-app.name" . }}
{{- end }}
