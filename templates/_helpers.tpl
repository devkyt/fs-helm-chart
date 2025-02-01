{{- define "common.labels" }}
generator: helm
app: {{ .Chart.Name | quote }}
version: {{ .Chart.AppVersion | quote }}
chart: "{{ .Chart.Name }}-v{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
{{- end }}

{{- define "proxy.resources" }}
{{- if .Values.proxy.resources }}
  {{- toYaml .Values.proxy.resources }}
{{- else }}
  requests:
    memory: 1Gi
    cpu: "500m"
  limits:
    memory: 1Gi
    cpu: "500m"
{{- end }}
{{- end }}

{{- define "app.resources" }}
{{- if .Values.proxy.resources }}
  {{- toYaml .Values.app.resources }}
{{- else }}
  requests:
    memory: 1Gi
    cpu: "500m"
  limits:
    memory: 1Gi
    cpu: "500m"
{{- end }}
{{- end }}