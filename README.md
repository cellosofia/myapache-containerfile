# My Apache Statically Served Web App

Este repositorio contiene una aplicación web estática simple que utiliza Apache HTTP Server para servir contenido. El sistema de construcción está definido en `Containerfile`, que empaqueta todo en una imagen de Docker/Podman lista para desplegar.

## ⚙️ Estructura del Proyecto

El proyecto consiste en:
*   `index.html`: La página de inicio principal.
*   `info.html`: Información adicional sobre la aplicación.
*   `Containerfile`: Define los pasos para construir la imagen de contenedor de Apache.
*   `AGENTS.md`: Documentación interna para agentes de desarrollo.

## 🚀 Instalación y Construcción

Para construir la imagen del contenedor, siga estos pasos desde la raíz del repositorio:

1.  **Build**: Use el archivo `Containerfile` con el comando de su plataforma de contenedorización (e.g., `podman build -t my-apache-app .`).
    *   *Nota:* El `Containerfile` se encarga de instalar Apache, configurar el puerto 8080 y copiar los archivos estáticos.

2.  **Ejecución**: Una vez construida la imagen, puede ejecutar el contenedor mapeando el puerto 8080:
    *   `podman run -d -p 8080:8080 --name web-server my-apache-app`

## 🌐 Uso

La aplicación está lista para ser consumida a través del puerto 8080.

Simplemente acceda a `http://localhost:8080` en su navegador para ver la página estática servida por Apache.

---
*Nota: Verifique siempre la documentación en `AGENTS.md` para guías profundas de desarrollo.*