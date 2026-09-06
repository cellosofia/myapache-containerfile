## Project Structure and Workflow

**OVERVIEW**: This repository deploys a simple, static web application packaged using Apache HTTP Server within a container.

**GUIDELINES**:
*   **Build Tool**: Always use the `Containerfile` for building the image.
*   **Build Steps**: The `Containerfile` defines these specific actions:
    1.  **Dependencies**: Instalar Apache (`httpd`) usando `dnf`.
    2.  **Configuración del puerto**: Modifica la configuración predeterminada para escuchar en el puerto `8080` (reemplazando el puerto `80` por `8080` en el archivo `httpd.conf`).
    3.  **Contenido Estático**: Copia `index.html` y `info.html` a `/var/www/html/`.
    4.  **Seguridad**: Cambia el usuario de ejecución al ID `1001` y establece permisos adecuados para los archivos de log.
*   **Entrypoint**: El comando de entrada (`ENTRYPOINT`) debe ejecutar `/usr/sbin/httpd` y usar `CMD ["-D", "FOREGROUND"]`.
*   **Puertos**: La aplicación está diseñada para ejecutarse en el puerto `8080`.

**Ejecución de Prueba**:
*   **Local**: Para verificar el servicio localmente, se recomienda ejecutar `curl http://localhost:8080`. (Verificación exitosa de este paso en la sesión).

**Verificación**:
*   Pruebas unitarias o linting de código son inaplicables. La verificación debe centrarse en el éxito de la construcción del contenedor y la capacidad de servir contenido correctamente en el puerto 8080.

**Pitfall (Atrapamiento común)**:
*   El sistema de arranque requiere que el contenido estático sea copiado de los archivos locales (`index.html`, `info.html`) al contenedor en la fase de construcción. No se debe asumir que los archivos servirán automáticamente.
