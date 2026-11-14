# RAIZ LOCAL



**Descripción de Raíz Local:**



Raíz Local es una plataforma web desarrollada para fomentar el comercio y el intercambio de productos en las comunidades rurales de Tolimán, Querétaro. Su propósito es facilitar que los productores y habitantes puedan ofrecer, consultar y adquirir productos de su comunidad mediante un espacio digital.

La plataforma permite a los usuarios registrarse como clientes, vendedores o ambos, publicar productos, explorar un catálogo, consultar información de los artículos y contactar directamente con los vendedores. Además, busca impulsar el consumo local y fortalecer la economía de la comunidad mediante la compra y el intercambio de productos.

Tecnologías utilizadas.



**Tecnologías utilizadas:**



Para el desarrollo de Raíz Local se utilizan las siguientes tecnologías:



* HTML5: estructura y organización del contenido de la plataforma.
* CSS3: diseño y presentación visual de las interfaces.
* JavaScript: implementación de interacciones y funcionalidades en el lado del cliente.
* PHP: desarrollo de la lógica del sistema y procesamiento de solicitudes.
* MySQL: almacenamiento y administración de la información de usuarios, productos, favoritos y pedidos.
* Apache: servidor web encargado de procesar y mostrar la aplicación.
* Requisitos de instalación.
* phpMyAdmin: herramienta para administrar la base de datos.
* Docker: herramienta para ejecutar los servicios de la aplicación mediante contenedores.
* Git y GitHub: control de versiones y almacenamiento del código fuente.



**Cómo descargar el repositorio.**



**Configurar las variables de entorno.**



El proyecto utiliza la biblioteca PHPDotenv para administrar las variables de entorno y proteger las credenciales de conexión a la base de datos.

Para configurar estas variables:

* Ubicarse en la carpeta principal del proyecto.
* Crear un archivo llamado .env.
* Agregar las siguientes variables:



DB\_HOST=127.0.0.1

DB\_NAME=raiz\_local

DB\_USER=raiz\_user

DB\_PASSWORD=coloca\_una\_clave\_segura

DB\_ROOT\_PASSWORD=coloca\_otra\_clave\_segura



El archivo .env no debe subirse al repositorio de GitHub, ya que contiene información confidencial. Para evitar su publicación, se encuentra incluido en el archivo .gitignore.



**Cómo ejecutar Docker.**



Cuando tengas todos los archivos y el respaldo SQL preparado:

Abre la terminal de Visual Studio Code en la carpeta principal del proyecto.

Primero verifica que la configuración sea válida:

**docker compose config --quiet**

Si no muestra errores, construye e inicia los servicios:

**docker compose up -d --build**

Después consulta su estado:

**docker compose ps**

Una vez que ya salió el resultado esperado ya se podrá acceder.



**Cómo acceder a la aplicación.**



Una vez iniciados correctamente los contenedores:

* Abrir un navegador web.
* Escribir la siguiente dirección en la barra de navegación: http://localhost:8080
* Se mostrará la página principal de Raíz Local, desde donde se podrá acceder a las funcionalidades disponibles de la plataforma.

