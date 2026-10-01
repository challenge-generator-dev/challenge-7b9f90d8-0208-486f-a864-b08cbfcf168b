# Despliegue de una plataforma de microservicios con Kubernetes

Tu tarea es diseñar y desplegar una plataforma de microservicios para una fintech. Los servicios deben ser desplegados usando Kubernetes y gestionados con Helm. Debes implementar un flujo de GitOps con ArgoCD para asegurar que los cambios en el código se reflejen automáticamente en el entorno de producción. Además, debes configurar monitoreo con Prometheus y Grafana para tener visibilidad sobre el rendimiento y la salud de los servicios. Los servicios deben ser idempotentes y soportar un throughput de 1000 solicitudes por segundo con un SLA de 99.9%.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Kubernetes DevOps |
| **Nivel** | junior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 40 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Kubernetes

**Objetivo:** Configurar un clúster de Kubernetes y desplegar un servicio básico.

**Tiempo estimado:** 8 horas

**Instrucciones:**

- Configurar un clúster de Kubernetes en un entorno de pruebas.
- Desplegar un servicio básico que responda a solicitudes HTTP.

**Entregable:** Clúster de Kubernetes configurado y servicio básico desplegado.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre la arquitectura de Kubernetes y sus componentes.
- Explorar opciones para la gestión de clústeres.

</details>

### Fase 2: Gestión de microservicios con Helm

**Objetivo:** Usar Helm para gestionar la implementación de microservicios.

**Tiempo estimado:** 10 horas

**Instrucciones:**

- Crear un chart de Helm para un microservicio.
- Desplegar el microservicio usando el chart de Helm.

**Entregable:** Chart de Helm creado y microservicio desplegado.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre Helm y sus beneficios para la gestión de microservicios.
- Explorar opciones para la parametrización de los charts de Helm.

</details>

### Fase 3: Implementación de GitOps con ArgoCD

**Objetivo:** Implementar un flujo de GitOps con ArgoCD para la gestión de cambios.

**Tiempo estimado:** 10 horas

**Instrucciones:**

- Configurar ArgoCD para sincronizar el estado deseado de los servicios con el código en el repositorio.
- Realizar cambios en el código y verificar que se reflejen automáticamente en el entorno de producción.

**Entregable:** Flujo de GitOps con ArgoCD implementado y funcionando.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre GitOps y sus beneficios para la gestión de cambios.
- Explorar opciones para la integración de ArgoCD con diferentes repositorios de código.

</details>

### Fase 4: Configuración de monitoreo con Prometheus y Grafana

**Objetivo:** Configurar monitoreo para los servicios desplegados usando Prometheus y Grafana.

**Tiempo estimado:** 12 horas

**Instrucciones:**

- Instalar y configurar Prometheus para recopilar métricas de los servicios.
- Configurar Grafana para visualizar las métricas recopiladas por Prometheus.

**Entregable:** Monitoreo con Prometheus y Grafana configurado y funcionando.

<details>
<summary>Pistas de conocimiento</summary>

- Investigar sobre Prometheus y Grafana y sus capacidades de monitoreo.
- Explorar opciones para la visualización de métricas en Grafana.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Kubernetes y cuáles son sus componentes principales?
- **paraQueSirve**: ¿Para qué sirve Helm en la gestión de microservicios?
- **comoSeUsa**: ¿Cómo se usa ArgoCD para implementar un flujo de GitOps?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar monitoreo con Prometheus y Grafana y cómo se solucionan?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño de una plataforma de microservicios con Kubernetes?

## Criterios de Evaluacion

- Configuración de un clúster de Kubernetes y despliegue de un servicio básico.
- Creación y uso de un chart de Helm para gestionar la implementación de microservicios.
- Implementación de un flujo de GitOps con ArgoCD para la gestión de cambios.
- Configuración de monitoreo con Prometheus y Grafana para los servicios desplegados.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
