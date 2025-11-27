💊 MediClick — Plataforma Web de Farmacia con Modelos 3D (Tomcat 11 + JSP)

MediClick es una aplicación web moderna desarrollada en Java (JSP/Servlets) y desplegada en Apache Tomcat 11.
Su principal objetivo es ofrecer un sistema de gestión farmacéutica con una interfaz atractiva e interactiva, incorporando modelos 3D GLB para mejorar la experiencia del usuario al visualizar productos.

🚀 Características Principales

🛒 Gestión de productos farmacéuticos

👤 Sistema de usuarios con roles:

Administrador

Vendedor

Cliente

📦 Carrito de compras dinámico

🧩 Visualización 3D de productos mediante modelos GLB

📄 Módulo de facturación y control de stock

🗄️ Conexión con base de datos PostgreSQL

🔐 Login y registro con validación

🎨 Diseño responsive con Bootstrap 5

🧭 Menús dinámicos basados en el tipo de usuario

⚙️ Arquitectura MVC con Servlets y JSP

🌐 Compatible con Tomcat 9, 10 y 11

🧠 Objetivo del Proyecto

Crear una plataforma moderna e intuitiva para farmacias que permita gestionar productos, ventas y usuarios, incorporando además elementos visuales 3D para ofrecer una experiencia interactiva única.

🛠️ Tecnologías Utilizadas
Backend

Java 17 / Java 21

Servlets (Jakarta EE)

JSP

JDBC

Apache Tomcat 11

Frontend

HTML5

CSS3

Bootstrap 5.3

JavaScript

GLTF / GLB Viewer (modelos 3D)

Base de Datos

PostgreSQL

SQL Scripts personalizados

Triggers y bitácora de auditoría

Herramientas

IntelliJ IDEA / Eclipse

GitHub / GitHub Desktop

PgAdmin

Canva (para imágenes del proyecto)

📁 Estructura del Proyecto
MediClick_Tomcat11/
│
├── src/
│   ├── main/
│   │   ├── java/         # Controladores, DAOs, lógica
│   │   ├── webapp/       # JSP, CSS, JS, modelos 3D
│   │   │   ├── img/
│   │   │   ├── css/
│   │   │   ├── js/
│   │   │   ├── modelos3d/  # Archivos GLB
│   │   │   └── paginas JSP
│   └── resources/
│
├── pom.xml (si usas Maven)
└── README.md

⚙️ Instalación y Ejecución
1. Clonar el repositorio
git clone https://github.com/tuusuario/MediClick_Tomcat11.git

2. Importar el proyecto

Abrir IntelliJ, Eclipse o NetBeans

Importar como Proyecto Java Web / Maven

3. Configurar Tomcat

Agregar un servidor Tomcat 11

Definir ruta del proyecto como Deployment Artifact

4. Crear la base de datos en PostgreSQL

Ejecutar tus scripts:

CREATE DATABASE mediclick;


Importar tablas y triggers:

\i rutas/tablas.sql
\i rutas/triggers_bitacora.sql

5. Ejecutar la aplicación

Abrir en el navegador:

http://localhost:8080/MediClick/

🖼️ Capturas del Proyecto

(Agrega aquí las capturas cuando quieras, yo puedo ayudarte a editarlas)

Ejemplo:

🔐 Login

🛒 Carrito

🧬 Modelos 3D

📌 Funcionalidades destacadas

Buscador inteligente de productos

Ingreso y edición de productos con imágenes y modelos 3D

Registro de ventas por usuario

Auditoría en base de datos (bitácora)

Panel administrativo con estadísticas básicas

🧪 Estado del Proyecto

✔️ En desarrollo activo
✔️ Funcionalidades principales completadas
⬜ Módulo de reportes
⬜ Integración con correo electrónico

📚 Autores

Proyecto desarrollado por:

Emily Mabel Ortega Constante

Otros integrantes del equipo (si deseas agregarlos)

📄 Licencia

Este proyecto es de uso académico.
Puedes copiar, estudiar y modificar el código según tus necesidades.

🌟 Contribuciones

¡Se aceptan mejoras!
Si deseas colaborar:

Haz un fork

Crea un branch:
git checkout -b feature-nueva-funcion

Sube tus cambios

Crea un Pull Request
