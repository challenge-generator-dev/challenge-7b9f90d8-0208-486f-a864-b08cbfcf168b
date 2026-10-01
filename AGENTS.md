# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Despliegue de una plataforma de microservicios con Kubernetes**.

| | |
|---|---|
| Tema | Kubernetes DevOps |
| Nivel | junior-l2 |
| Chapter | DevSecOps |
| Especialidad | DevSecOps |
| Stack | YAML / Kubernetes |
| Patron arquitectonico | GitOps con ArgoCD y Helm para despliegue de microservicios |
| Tiempo estimado | 40 horas |

## Receta del stack

Esqueleto obligatorio:

- `azure-pipelines.yml o .github/workflows/*.yml con stages reales`
- `Dockerfile multi-stage`
- `.dockerignore`
- `terraform/ con main.tf, variables.tf y outputs.tf`
- `terraform/environments/{env}/terraform.tfvars`
- `scripts/ con los scripts de build y healthcheck`
- `sonar-project.properties`

Trampas conocidas:

- `required_version` de Terraform va como RANGO (`>= 1.5`), nunca exacto: pineado, el proyecto no corre con otra version instalada.
- Los providers tambien con restriccion flexible (`~> 5.0`).
- El Dockerfile multi-stage necesita que la etapa final copie el artefacto de la etapa de build, no el codigo fuente.

Dependencias:

- kubernetes/helm 3.14.0
- argoproj/argo-cd 2.9.5
- prometheus/prometheus 2.47.0
- grafana/grafana 10.2.3
- kubernetes/client-go 0.28.2

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración inicial de Kubernetes**: Clúster de Kubernetes configurado y servicio básico desplegado.
- **Fase 2 — Gestión de microservicios con Helm**: Chart de Helm creado y microservicio desplegado.
- **Fase 3 — Implementación de GitOps con ArgoCD**: Flujo de GitOps con ArgoCD implementado y funcionando.
- **Fase 4 — Configuración de monitoreo con Prometheus y Grafana**: Monitoreo con Prometheus y Grafana configurado y funcionando.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `charts/microservice/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- [ ] `services/service-a/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.

## Lo que falta y tenes que completar

### 1. Archivos que la arquitectura declara (2 de 15)

La propuesta arquitectonica del reto los lista y no llegaron al repo. Crealos con implementacion real, respetando la capa en la que viven:

- [ ] `monitoring/prometheus-config.yaml`
- [ ] `monitoring/grafana-dashboard.json`

### Presentes (13)

- `providers.tf`
- `variables.tf`
- `main.tf`
- `README.md`
- `charts/microservice/Chart.yaml`
- `charts/microservice/values.yaml`
- `charts/microservice/templates/deployment.yaml`
- `charts/microservice/templates/service.yaml`
- `charts/microservice/templates/hpa.yaml`
- `manifests/argocd-app.yaml`
- `services/service-a/deployment.yaml`
- `services/service-a/service.yaml`
- `argocd/argocd-cm.yaml`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `charts`
- `manifests`
- `argocd`
- `monitoring`
- `services`

## Verificacion

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **GitOps con ArgoCD y Helm para despliegue de microservicios**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Brecha que el reto ataca: Diseñar y desplegar una plataforma de microservicios con Kubernetes, Helm, GitOps con ArgoCD y monitoreo con Prometheus y Grafana

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
