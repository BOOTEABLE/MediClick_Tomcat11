<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>MediClick - FARMACIA</title>

    <link rel="stylesheet" href="estilos3.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <style>
        /* ======== ESTILOS GENERALES ======== */
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7f7f7;
            color: #333;
        }

        header {
            background: linear-gradient(135deg, #c62828, #ff5252);
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        header .logo {
            width: 120px;
            border-radius: 50%;
            border: 2px solid white;
            background-color: white;
            padding: 8px;
            margin-bottom: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }

        nav {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            background-color: #2c2c2c;
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
        }

        nav a, nav form button {
            text-decoration: none;
            color: white;
            padding: 15px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            background: none;
            border-radius: 8px;
        }

        nav a:hover, nav a.active, nav form button:hover {
            background-color: #c62828;
        }

        .login-btn {
            background-color: #28a745;
            border-radius: 12px;
            margin-left: 15px;
        }

        .logout-btn {
            background-color: #c62828;
            border-radius: 12px;
            margin-left: 15px;
        }

        .welcome-msg {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-weight: bold;
            color: #c62828;
            margin-left: 20px;
        }

        section {
            padding: 50px 20px;
            max-width: 1100px;
            margin: auto;
        }

        h3 {
            color: #c62828;
            margin-bottom: 15px;
        }

        /* ======== MASCOTA / MISIÓN ======== */
        .mascota-section {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #ffffff, #ffeaea);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 60px 30px;
            gap: 40px;
            text-align: center;
        }

        .mascota-section img {
            width: 280px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .mascota-text {
            max-width: 500px;
        }

        .mascota-text h3 {
            font-size: 2em;
            color: #c62828;
        }
        
         .carousel {
            max-width: 400px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
        }

        .carousel img {
            height: 260px;
            object-fit: cover;
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .social-links a {
            background-color: #c62828;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            text-decoration: none;
            transition: all 0.3s;
        }

        .social-links a:hover {
            background-color: #a31212;
        }

        /* ======== BANNER MOTIVACIONAL ======== */
        .banner-frase {
            background: linear-gradient(135deg, #ffebee, #ffcdd2);
            text-align: center;
            padding: 60px 20px;
            margin-top: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .banner-frase h2 {
            color: #c62828;
            font-size: 1.8em;
            font-weight: 700;
            font-style: italic;
        }

        /* ======== VALORES ======== */
        .valores {
            text-align: center;
            margin-top: 60px;
        }

        .tarjetas-valores {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 30px;
        }

        .tarjeta {
            background-color: #fff;
            width: 300px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            padding: 25px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .tarjeta:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .tarjeta h4 {
            color: #c62828;
            font-weight: 700;
            margin-bottom: 10px;
        }

        /* ======== MAPA ======== */
        .mapa-section {
            text-align: center;
            margin-top: 60px;
        }

        .mapa {
            width: 100%;
            max-width: 800px;
            height: 450px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            margin-top: 20px;
        }

        /* ======== FOOTER Y ASISTENTE ======== */
        footer {
            text-align: center;
            padding: 20px;
            background: #b71c1c;
            color: white;
            margin-top: 60px;
        }

        .spider-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 150px;
            height: 150px;
        }

        .dialogo {
            position: absolute;
            bottom: 160px;
            right: 0;
            background-color: #c62828;
            color: white;
            padding: 10px 15px;
            border-radius: 12px;
            font-size: 0.9em;
            width: 180px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
    </style>
</head>

<body>
<main>
    <header>
        <img src="../image/logo.png" alt="Logo MediClick" class="logo">
        <h1>MediClick</h1>
        <h2>Tu salud, nuestra prioridad</h2>
    </header>

    <nav>
        <a class="active" href="index.jsp">Inicio</a>
        <a href="servicios.jsp">Servicios</a>
        <a href="productos.jsp">Productos</a>
        <a href="#mapa">Ubicación</a>

        <%
            String usuario = (String) session.getAttribute("usuario");
            if (usuario != null) {
        %>
            <div class="welcome-msg">👋 Bienvenido, <%= usuario %>!</div>
            <form action="cerrarSesion.jsp" method="post" style="display:inline;">
                <button type="submit" class="logout-btn">Cerrar Sesión</button>
            </form>
        <% } else { %>
            <a href="login.jsp" class="login-btn">Iniciar Sesión</a>
        <% } %>
    </nav>

    <!-- 🩺 SECCIÓN MISION + CARRUSEL -->
    <section class="mascota-section">
        <div class="mascota-text">
            <h3>Nuestra Misión</h3>
            <p><strong>Misión:</strong> Brindar atención médica integral y personalizada, utilizando tecnología avanzada para la recuperación y bienestar de nuestros pacientes.</p>
            <p><strong>Visión:</strong> Ser líderes en innovación médica y farmacéutica, creando un entorno humano y de confianza.</p>

            <div class="social-links">
                <a href="https://www.instagram.com/_meybl3_/" target="_blank">Instagram</a>
                <a href="https://www.facebook.com/Meyblemy" target="_blank">Facebook</a>
            </div>
        </div>

        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="../image/mediclick.jpg" class="d-block w-100" alt="Farmacia 1">
            </div>
            <div class="carousel-item">
              <img src="../image/click.png" class="d-block w-100" alt="Farmacia 2">
            </div>
            <div class="carousel-item">
              <img src="../image/logo2.png" class="d-block w-100" alt="Farmacia 3">
            </div>
          </div>
        </div>
    </section>

    <!-- 🌿 BANNER MOTIVACIONAL -->
    <section class="banner-frase">
        <h2>"Cuidar tu salud es nuestra forma de cuidar el futuro"</h2>
    </section>

    <!-- 💊 SECCIÓN DE VALORES -->
    <section class="valores">
        <h3>Nuestros Valores</h3>
        <div class="tarjetas-valores">
            <div class="tarjeta">
                <h4>Compromiso</h4>
                <p>Nos esforzamos cada día para ofrecer atención de calidad y un servicio humano, ético y responsable.</p>
            </div>
            <div class="tarjeta">
                <h4>Innovación</h4>
                <p>Implementamos tecnología moderna para mejorar los procesos médicos y farmacéuticos.</p>
            </div>
            <div class="tarjeta">
                <h4>Confianza</h4>
                <p>Fomentamos relaciones transparentes con nuestros pacientes, basadas en el respeto y la seguridad.</p>
            </div>
        </div>
    </section>

    <!-- 🗺️ MAPA -->
    <section class="mapa-section" id="mapa">
        <h3>Encuéntranos aquí</h3>
        <iframe src="https://www.google.com/maps/d/u/0/embed?mid=1XztvYwbCDghFlOaxw73gMKRhC8IWsw8&ehbc=2E312F&noprof=1" width="640" height="480"></iframe>
    </section>

    <footer>
        <p>&copy; 2025 MediClick - FARMACIA PRIVADA</p>
    </footer>

    <div class="spider-container">
        <div class="dialogo">¿Te puedo ayudar en algo?</div>
        <model-viewer src="../image/mascota.glb" alt="Asistente virtual"
                      auto-rotate camera-controls
                      style="width:150px; height:150px;">
        </model-viewer>
    </div>
</main>
</body>
</html>
