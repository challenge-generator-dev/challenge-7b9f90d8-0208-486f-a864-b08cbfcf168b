# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `charts/microservice/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `services/service-a/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Archivos que la arquitectura del reto declara y no estan

Creálos con implementacion real, en la capa que les corresponde:

- `monitoring/prometheus-config.yaml`
- `monitoring/grafana-dashboard.json`

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Contexto técnico original
Diseñar y desplegar una plataforma de microservicios con Kubernetes, Helm, GitOps con ArgoCD y monitoreo con Prometheus y Grafana

### Reto
- Tema: Kubernetes DevOps
- Seniority: junior-l2
- Tipo: practical
- Título: Despliegue de una plataforma de microservicios con Kubernetes
- Tiempo estimado: 40 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Kubernetes — objetivo: Configurar un clúster de Kubernetes y desplegar un servicio básico. — entregable (NO resolver): Clúster de Kubernetes configurado y servicio básico desplegado.
- Fase 2: Gestión de microservicios con Helm — objetivo: Usar Helm para gestionar la implementación de microservicios. — entregable (NO resolver): Chart de Helm creado y microservicio desplegado.
- Fase 3: Implementación de GitOps con ArgoCD — objetivo: Implementar un flujo de GitOps con ArgoCD para la gestión de cambios. — entregable (NO resolver): Flujo de GitOps con ArgoCD implementado y funcionando.
- Fase 4: Configuración de monitoreo con Prometheus y Grafana — objetivo: Configurar monitoreo para los servicios desplegados usando Prometheus y Grafana. — entregable (NO resolver): Monitoreo con Prometheus y Grafana configurado y funcionando.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: providers.tf ===
# Terraform configuration for Kubernetes and Helm providers
# This file declares the required providers and their versions to interact with the Kubernetes cluster
# and manage Helm releases.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}

# Configure the Kubernetes provider to interact with the cluster
# The provider will use the default kubeconfig file (~/.kube/config)
# or the context specified in the KUBE_CONFIG_CONTEXT environment variable.
provider "kubernetes" {
  # Use the default kubeconfig file
  config_path = "~/.kube/config"
}

# Configure the Helm provider to manage Helm releases
# The provider will use the same kubeconfig configuration as the Kubernetes provider.
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Configure the kubectl provider for applying Kubernetes manifests directly
# This is useful for resources that are not yet supported by the Kubernetes provider.
provider "kubectl" {
  # Use the default kubeconfig file
  config_path = "~/.kube/config"
}

# Configure the ArgoCD provider for managing ArgoCD applications
# This provider requires the ArgoCD server URL and authentication credentials.
provider "argocd" {
  server_addr = var.argocd_server_addr
  insecure    = var.argocd_insecure
  username    = var.argocd_username
  password    = var.argocd_password
}

# === ARCHIVO: variables.tf ===
# Terraform variables for configuring the Kubernetes, Helm, and ArgoCD providers
# These variables allow customization of the deployment without modifying the provider configuration.

variable "kube_config_path" {
  description = "Path to the kubeconfig file used by the Kubernetes and Helm providers"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_config_context" {
  description = "Name of the Kubernetes context to use from the kubeconfig file"
  type        = string
  default     = ""
}

variable "argocd_server_addr" {
  description = "URL of the ArgoCD server (e.g., 'argocd.example.com')"
  type        = string
}

variable "argocd_insecure" {
  description = "Whether to skip TLS verification for the ArgoCD server"
  type        = bool
  default     = false
}

variable "argocd_username" {
  description = "Username for authenticating with the ArgoCD server"
  type        = string
  default     = "admin"
}

variable "argocd_password" {
  description = "Password for authenticating with the ArgoCD server"
  type        = string
  sensitive   = true
}

variable "namespace" {
  description = "Kubernetes namespace where the microservices will be deployed"
  type        = string
  default     = "microservices"
}

variable "service_account_name" {
  description = "Name of the Kubernetes service account used by the microservices"
  type        = string
  default     = "microservice-sa"
}

variable "prometheus_namespace" {
  description = "Kubernetes namespace where Prometheus will be deployed"
  type        = string
  default     = "monitoring"
}

variable "grafana_namespace" {
  description = "Kubernetes namespace where Grafana will be deployed"
  type        = string
  default     = "monitoring"
}

variable "argocd_namespace" {
  description = "Kubernetes namespace where ArgoCD will be deployed"
  type        = string
  default     = "argocd"
}

variable "helm_chart_version" {
  description = "Version of the Helm chart to deploy for the microservices"
  type        = string
  default     = "0.1.0"
}

variable "service_a_image" {
  description = "Docker image for service-a"
  type        = string
  default     = "ghcr.io/example/service-a:latest"
}

variable "service_a_replicas" {
  description = "Number of replicas for service-a"
  type        = number
  default     = 2
}

variable "service_a_cpu_request" {
  description = "CPU request for service-a containers"
  type        = string
  default     = "100m"
}

variable "service_a_memory_request" {
  description = "Memory request for service-a containers"
  type        = string
  default     = "256Mi"
}

variable "service_a_cpu_limit" {
  description = "CPU limit for service-a containers"
  type        = string
  default     = "500m"
}

variable "service_a_memory_limit" {
  description = "Memory limit for service-a containers"
  type        = string
  default     = "512Mi"
}

variable "argocd_repo_url" {
  description = "Git repository URL for ArgoCD application synchronization"
  type        = string
}

variable "argocd_target_revision" {
  description = "Git branch, tag, or commit SHA for ArgoCD application synchronization"
  type        = string
  default     = "main"
}

variable "prometheus_version" {
  description = "Version of Prometheus to deploy"
  type        = string
  default     = "2.47.0"
}

variable "grafana_version" {
  description = "Version of Grafana to deploy"
  type        = string
  default     = "10.2.3"
}

variable "argocd_version" {
  description = "Version of ArgoCD to deploy"
  type        = string
  default     = "2.9.5"
}

// === ARCHIVO: main.tf ===
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-fintech-prod"
    key    = "kubernetes-cluster/state"
    region = "us-east-1"
  }
}

provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  token                  = var.cluster_token

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    token                  = var.cluster_token

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    }
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    labels = {
      name        = "monitoring"
      environment = var.environment
    }
  }
}

resource "kubernetes_namespace" "microservices" {
  metadata {
    name = "microservices"
    labels = {
      name        = "microservices"
      environment = var.environment
    }
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
    labels = {
      name        = "argocd"
      environment = var.environment
    }
  }
}

resource "kubernetes_secret" "docker_registry" {
  metadata {
    name      = "docker-registry-secret"
    namespace = kubernetes_namespace.microservices.id
  }

  data = {
    ".dockerconfigjson" = var.docker_config_json
  }

  type = "kubernetes.io/dockerconfigjson"
}

resource "kubernetes_config_map" "prometheus_rules" {
  metadata {
    name      = "prometheus-alerts"
    namespace = kubernetes_namespace.monitoring.id
  }

  data = {
    "alerts.yml" = <<-EOT
      groups:
        - name: microservice-alerts
          rules:
            - alert: HighErrorRate
              expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: "High error rate detected"
                description: "Service {{ $labels.service }} has error rate above 5%"
            - alert: HighLatency
              expr: histogram_quantile(0.99, rate(http_request_duration_seconds_bucket[5m])) > 1
              for: 5m
              labels:
                severity: warning
              annotations:
                summary: "High latency detected"
                description: "Service {{ $labels.service }} p99 latency above 1s"
            - alert: ServiceDown
              expr: up{job="kubernetes-nodes"} == 0
              for: 2m
              labels:
                severity: critical
              annotations:
                summary: "Service is down"
                description: "{{ $labels.instance }} has been down for more than 2 minutes"
    EOT
  }
}

resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.8.4"
  namespace  = kubernetes_namespace.argocd.id
  timeout    = 300

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hostname"
    value = var.argocd_hostname
  }

  set {
    name  = "dex.enabled"
    value = "false"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "25.8.0"
  namespace  = kubernetes_namespace.monitoring.id
  timeout    = 300

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "pushgateway.enabled"
    value = "true"
  }

  set {
    name  = "alertmanager.enabled"
    value = "true"
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.58.9"
  namespace  = kubernetes_namespace.monitoring.id
  timeout    = 300

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "admin.password"
    value = var.grafana_admin_password
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0]"
    value = var.grafana_hostname
  }
}

// === ARCHIVO: README.md ===
# Plataforma de Microservicios - Kubernetes DevOps

## Descripción del Proyecto

Plataforma de microservicios para aplicación fintech desplegada en Kubernetes con gestión GitOps mediante ArgoCD, monitoreo con Prometheus y visualización con Grafana.

## Estructura del Proyecto

```
.
├── main.tf                    # Configuración de infraestructura con Terraform
├── providers.tf               # Proveedores de Terraform
├── variables.tf               # Variables del proyecto
├── charts/                    # Charts de Helm para microservicios
│   └── microservice/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
├── manifests/                 # Manifiestos de ArgoCD
│   └── argocd-app.yaml
├── monitoring/                # Configuración de monitoreo
│   ├── prometheus-config.yaml
│   └── grafana-dashboard.json
├── services/                  # Manifiestos de servicios
│   └── service-a/
├── argocd/                    # Configuración de ArgoCD
│   └── argocd-cm.yaml
└── docs/                      # Documentación adicional
```

## Requisitos Previos

- AWS CLI configurado con credenciales adecuadas
- Terraform >= 1.6.0 instalado localmente
- kubectl instalado y configurado
- Helm 3.x instalado
- Acceso a un clúster EKS existente o capacidad de crearlo

## Configuración del Clúster

### 1. Inicializar Terraform

```bash
terraform init
```

### 2. Validar la configuración

```bash
terraform validate
terraform plan
```

### 3. Aplicar la infraestructura

```bash
terraform apply
```

Este comando creará:
- Namespaces: monitoring, microservices, argocd
- Secret para autenticación con registry Docker
- ConfigMap con reglas de alertas de Prometheus
- Deployments de ArgoCD, Prometheus y Grafana mediante Helm

## Despliegue de Microservicios

### Usando Helm

```bash
cd charts/microservice
helm install microservice . -n microservices
```

### Actualizar valores

```bash
helm upgrade microservice . -n microservices -f values-prod.yaml
```

### Desinstalar

```bash
helm uninstall microservice -n microservices
```

## Configuración de ArgoCD

### Acceder a ArgoCD

Después de aplicar Terraform, obtener la URL del servicio:

```bash
kubectl get svc -n argocd argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

### Obtener contraseña inicial

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### Aplicar aplicación de ArgoCD

```bash
kubectl apply -f manifests/argocd-app.yaml
```

### Sincronización manual

```bash
argocd app sync microservice
```

## Monitoreo con Prometheus

### Acceder a Prometheus

```bash
kubectl get svc -n monitoring prometheus-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

### Ver métricas de servicios

Las métricas de los microservicios están disponibles en:
- Endpoint de métricas: `/metrics`
- Puerto: 8080

Etiquetas estándar aplicadas:
- `service`: nombre del servicio
- `version`: versión del despliegue
- `environment`: entorno de despliegue

### Reglas de alertas configuradas

- HighErrorRate: tasa de errores superior al 5%
- HighLatency: latencia p99 superior a 1 segundo
- ServiceDown: servicio no disponible

## Monitoreo con Grafana

### Acceder a Grafana

```bash
kubectl get svc -n monitoring grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

Credenciales por defecto:
- Usuario: admin
- Contraseña: configurada en variable `grafana_admin_password`

### Dashboards disponibles

El dashboard JSON en `monitoring/grafana-dashboard.json` incluye:
- Tasa de solicitudes por segundo
- Latencia p50, p95, p99
- Tasa de errores 4xx y 5xx
- Uso de recursos (CPU, memoria)
- Uptime de servicios

### Importar dashboard

1. Acceder a Grafana
2. Ir a Dashboards > Import
3. Cargar el archivo `monitoring/grafana-dashboard.json`

## Verificación del Sistema

### Verificar pods en ejecución

```bash
kubectl get pods -n microservices
kubectl get pods -n monitoring
kubectl get pods -n argocd
```

### Verificar servicios

```bash
kubectl get svc -n microservices
kubectl get svc -n monitoring
```

### Probar endpoint de métricas

```bash
kubectl port-forward -n microservices svc/microservice 8080:8080
curl http://localhost:8080/metrics
```

### Ver logs de pods

```bash
kubectl logs -n microservices -l app=microservice
```

## Escalado y Rendimiento

### Horizontal Pod Autoscaler

El HPA está configurado en el chart de Helm con:
- Mínimo de réplicas: 2
- Máximo de réplicas: 10
- Target CPU: 70%
- Target memoria: 80%

### Ajuste de recursos

Editar `values.yaml` del chart:

```yaml
resources:
  limits:
    cpu: 2000m
    memory: 2Gi
  requests:
    cpu: 500m
    memory: 512Mi
```

## Limpieza

### Eliminar recursos de Terraform

```bash
terraform destroy
```

### Eliminar namespaces manualmente

```bash
kubectl delete namespace monitoring
kubectl delete namespace microservices
kubectl delete namespace argocd
```

## Variables de Configuración

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| cluster_endpoint | Endpoint del clúster EKS | - |
| cluster_ca_certificate | Certificate CA del clúster | - |
| cluster_token | Token de autenticación | - |
| cluster_name | Nombre del clúster | fintech-cluster |
| environment | Entorno de despliegue | production |
| argocd_hostname | Hostname para ArgoCD | argocd.fintech.com |
| grafana_hostname | Hostname para Grafana | grafana.fintech.com |
| grafana_admin_password | Contraseña de Grafana | - |
| docker_config_json | Configuración del registry Docker | - |

## Troubleshooting

### Pods en estado Pending

Verificar recursos disponibles:
```bash
kubectl describe pod <pod-name> -n <namespace>
```

### Errores de sincronización ArgoCD

Verificar logs:
```bash
kubectl logs -n argocd deployment/argocd-application-controller
```

### Prometheus no recibe métricas

Verificar ServiceMonitor:
```bash
kubectl get servicemonitor -n monitoring
```

### Grafana no conecta a Prometheus

Verificar DataSource:
```bash
kubectl get datasources -n monitoring
```

## SLA y Rendimiento

El sistema está configurado para soportar:
- Throughput: 1000 solicitudes por segundo
- SLA: 99.9% de disponibilidad
- Latencia objetivo: p99 < 500ms

## Mantenimiento

### Actualizar chart de Helm

```bash
cd charts/microservice
helm repo update
helm upgrade microservice . -n microservices
```

### Backup de estado de ArgoCD

```bash
argocd admin export -n argocd > argocd-backup.yaml
```


// === ARCHIVO: charts/microservice/Chart.yaml ===
apiVersion: v2
name: microservice
description: Chart de Helm para el despliegue de microservicios de la plataforma fintech
type: application
version: 1.0.0
appVersion: "1.0.0"
keywords:
  - fintech
  - microservicio
  - kubernetes
  - helm
  - gitops
maintainers:
  - name: Equipo DevOps
    email: devops@fintech.com
    url: https://fintech.com/devops
sources:
  - https://github.com/fintech/microservice
  - https://github.com/fintech/infrastructure
dependencies: []

// === ARCHIVO: charts/microservice/values.yaml ===
replicaCount: 3

image:
  repository: fintech/microservice
  pullPolicy: IfNotPresent
  tag: "1.0.0"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

service:
  type: ClusterIP
  port: 8080
  targetPort: 8080
  annotations: {}

ingress:
  enabled: true
  className: nginx
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-prod
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
  hosts:
    - host: microservice.fintech.com
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: microservice-tls
      hosts:
        - microservice.fintech.com

resources:
  limits:
    cpu: 1000m
    memory: 1Gi
  requests:
    cpu: 500m
    memory: 512Mi

autoscaling:
  enabled: true
  minReplicas: 3
  maxReplicas: 10
  targetCPUUtilizationPercentage: 70
  targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity: {}

podAnnotations:
  prometheus.io/scrape: "true"
  prometheus.io/port: "8080"
  prometheus.io/path: "/metrics"

podSecurityContext:
  runAsNonRoot: true
  runAsUser: 1000
  fsGroup: 1000

securityContext:
  allowPrivilegeEscalation: false
  readOnlyRootFilesystem: true
  capabilities:
    drop:
      - ALL

livenessProbe:
  httpGet:
    path: /health
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10
  timeoutSeconds: 5
  failureThreshold: 3

readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 3

env:
  - name: ENVIRONMENT
    value: "production"
  - name: LOG_LEVEL
    value: "info"
  - name: METRICS_ENABLED
    value: "true"
  - name: OTEL_EXPORTER_OTLP_ENDPOINT
    value: "http://otel-collector:4317"

configMap:
  app.config: |-
    server:
      port: 8080
      readTimeout: 30
      writeTimeout: 30
    database:
      maxConnections: 100
      connectionTimeout: 10
    cache:
      enabled: true
      ttl: 300

persistence:
  enabled: false
  storageClass: ""
  accessMode: ReadWriteOnce
  size: 1Gi

serviceAccount:
  create: true
  annotations: {}
  name: ""

rbac:
  create: true

networkPolicy:
  enabled: true
  ingressRules:
    - from:
        - namespaceSelector:
            matchLabels:
              name: monitoring
      ports:
        - protocol: TCP
          port: 9090

metrics:
  serviceMonitor:
    enabled: true
    interval: 30s
    scrapeTimeout: 10s
    labels: {}

// === ARCHIVO: charts/microservice/templates/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-deployment
  labels:
    app: {{ .Chart.Name }}
    chart: {{ .Chart.Name }}-{{ .Chart.Version }}
    release: {{ .Release.Name }}
    heritage: {{ .Release.Service }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ .Chart.Name }}
      release: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app: {{ .Chart.Name }}
        release: {{ .Release.Name }}
      annotations:
        {{- toYaml .Values.podAnnotations | nindent 8 }}
    spec:
      serviceAccountName: {{ .Values.serviceAccount.name | default (include "microservice.fullname" .) }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: {{ .Values.service.targetPort }}
              protocol: TCP
          livenessProbe:
            {{- toYaml .Values.livenessProbe | nindent 12 }}
          readinessProbe:
            {{- toYaml .Values.readinessProbe | nindent 12 }}
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
          env:
            {{- toYaml .Values.env | nindent 12 }}
          securityContext:
            {{- toYaml .Values.securityContext | nindent 12 }}
          volumeMounts: []
      volumes: []
      affinity:
        {{- toYaml .Values.affinity | nindent 8 }}
      nodeSelector:
        {{- toYaml .Values.nodeSelector | nindent 8 }}
      tolerations:
        {{- toYaml .Values.tolerations | nindent 8 }}


// === ARCHIVO: charts/microservice/templates/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: {{ include "microservice.fullname" . }}
  labels:
    {{- include "microservice.labels" . | nindent 4 }}
    app.kubernetes.io/component: service
  annotations:
    description: "Servicio interno para el microservicio de la plataforma fintech"
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
      {{- if and (eq .Values.service.type "NodePort") .Values.service.nodePort }}
      nodePort: {{ .Values.service.nodePort }}
      {{- end }}
  selector:
    {{- include "microservice.selectorLabels" . | nindent 4 }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "microservice.fullname" . }}-external
  labels:
    {{- include "microservice.labels" . | nindent 4 }}
    app.kubernetes.io/component: service
    app.kubernetes.io/traffic: external
  annotations:
    description: "Servicio externo para exponer el microservicio a usuarios finales"
    {{- if .Values.service.externalAnnotations }}
    {{- toYaml .Values.service.externalAnnotations | nindent 4 }}
    {{- end }}
spec:
  type: {{ .Values.service.externalType | default "LoadBalancer" }}
  ports:
    - port: {{ .Values.service.externalPort | default 80 }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "microservice.selectorLabels" . | nindent 4 }}
// === ARCHIVO: charts/microservice/templates/hpa.yaml ===
{{- if .Values.autoscaling.enabled }}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ include "microservice.fullname" . }}
  labels:
    {{- include "microservice.labels" . | nindent 4 }}
    app.kubernetes.io/component: autoscaler
  annotations:
    description: "Autoescalado horizontal basado en uso de CPU y memoria"
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ include "microservice.fullname" . }}
  minReplicas: {{ .Values.autoscaling.minReplicas }}
  maxReplicas: {{ .Values.autoscaling.maxReplicas }}
  metrics:
    {{- if .Values.autoscaling.targetCPUUtilizationPercentage }}
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: {{ .Values.autoscaling.targetCPUUtilizationPercentage }}
    {{- end }}
    {{- if .Values.autoscaling.targetMemoryUtilizationPercentage }}
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: {{ .Values.autoscaling.targetMemoryUtilizationPercentage }}
    {{- end }}
  {{- if .Values.autoscaling.behavior }}
  behavior:
    {{- toYaml .Values.autoscaling.behavior | nindent 4 }}
  {{- end }}
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ include "microservice.fullname" . }}-metrics
  labels:
    {{- include "microservice.labels" . | nindent 4 }}
    app.kubernetes.io/component: autoscaler
    app.kubernetes.io/purpose: custom-metrics
  annotations:
    description: "Autoescalado basado en métricas personalizadas de Prometheus"
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ include "microservice.fullname" . }}
  minReplicas: {{ .Values.autoscaling.minReplicas }}
  maxReplicas: {{ .Values.autoscaling.maxReplicas }}
  metrics:
    {{- if .Values.autoscaling.customMetrics }}
    {{- range .Values.autoscaling.customMetrics }}
    - type: Pods
      pods:
        metric:
          name: {{ .name }}
        target:
          type: AverageValue
          averageValue: {{ .averageValue }}
    {{- end }}
    {{- end }}
  {{- if .Values.autoscaling.customBehavior }}
  behavior:
    {{- toYaml .Values.autoscaling.customBehavior | nindent 4 }}
  {{- end }}
{{- end }}
// === ARCHIVO: manifests/argocd-app.yaml ===
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: microservice-platform
  namespace: argocd
  labels:
    app.kubernetes.io/name: microservice-platform
    app.kubernetes.io/part-of: fintech-platform
    app.kubernetes.io/managed-by: argocd
  annotations:
    description: "Aplicación principal de microservicios para la plataforma fintech"
    notifications.argoproj.io/subscribe.on-deployed: slack-notifications
    notifications.argoproj.io/subscribe.on-sync-failed: slack-alerts
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://github.com/fintech-platform/deployments.git
    targetRevision: main
    path: charts/microservice
    helm:
      valueFiles:
        - values-prod.yaml
      parameters:
        - name: image.tag
          value: latest
        - name: autoscaling.enabled
          value: "true"
        - name: autoscaling.minReplicas
          value: "3"
        - name: autoscaling.maxReplicas
          value: "20"
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
      allowEmpty: false
    syncOptions:
      - CreateNamespace=true
      - PruneLast=true
      - PrunePropagationPolicy=foreground
    retry:
      limit: 5
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 3m
  ignoreDifferences:
    - group: apps
      kind: Deployment
      jsonPointers:
        - /spec/replicas
    - group: ""
      kind: ConfigMap
      jsonPointers:
        - /data
  revisionHistoryLimit: 10


// === ARCHIVO: services/service-a/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: service-a
  labels:
    app: service-a
    version: v1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: service-a
  template:
    metadata:
      labels:
        app: service-a
        version: v1
    spec:
      containers:
      - name: service-a
        image: nginx:1.25
        ports:
        - containerPort: 8080
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 5

// === ARCHIVO: services/service-a/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: service-a
  labels:
    app: service-a
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: 8080
    protocol: TCP
    name: http
  selector:
    app: service-a
---
apiVersion: v1
kind: Service
metadata:
  name: service-a-nodeport
  labels:
    app: service-a
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 8080
    nodePort: 30080
    protocol: TCP
    name: http
  selector:
    app: service-a
---
apiVersion: v1
kind: Service
metadata:
  name: service-a-lb
  labels:
    app: service-a
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
    service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: "true"
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 8080
    protocol: TCP
    name: http
  - port: 443
    targetPort: 8443
    protocol: TCP
    name: https
  selector:
    app: service-a

// === ARCHIVO: argocd/argocd-cm.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
  labels:
    app.kubernetes.io/name: argocd-cm
    app.kubernetes.io/part-of: argocd
data:
  resource.customizations: |
    argoproj.io/Application:
      health.lua: |
        hs = {
          status = "Progressing",
          message = "Application is being processed",
          health = {
            status = "Healthy"
          }
        }
        if obj.status ~= nil then
          if obj.status.health ~= nil then
            hs.status = "Running"
            hs.message = "Application is running"
            hs.health.status = obj.status.health.status
            hs.health.message = obj.status.health.message
          end
        end
        return hs
  resource.compareoptions: |
    ignoreDifferences:
    - group: apps
      kind: Deployment
      jsonPointers:
        - /spec/replicas
    - group: apps
      kind: StatefulSet
      jsonPointers:
        - /spec/replicas
  application.instanceLabelKey: argocd.argoproj.io/instance
  reposerver.parallelism.limit: "10"
  controller.default.timeout: "180s"
  server.rootpath: ""
  server.basehref: ""
  server.staticassets: /shared/app
  server.enable.gzip: "true"
  server.repo.server: "argocd-repo-server:8086"
  server.dex.server: "argocd-dex-server:5556"
  server.metrics.enabled: "true"
  server.metrics.cache.enabled: "true"
  repository.credentials: |
    - url: https://github.com/
      passwordSecret:
        key: password
        name: argocd-github-creds
      usernameSecret:
        key: username
        name: argocd-github-creds
  k8sclient.content.types: application/yaml
  k8sclient.ratelimit.default: 10
  k8sclient.ratelimit.max: 100
  configManagementPlugin: |
    - name: my-custom-plugin
      init:
        command: [sh, -c]
        args: [echo "Initializing..."]
      generate:
        command: [sh, -c]
        args: [echo "Generating manifests..."]

```
