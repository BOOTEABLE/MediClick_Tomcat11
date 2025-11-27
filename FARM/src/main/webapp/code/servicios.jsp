<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servicios - MediClick (VR + Interactivos)</title>
    <link rel="stylesheet" href="estilos3.css" type="text/css">

    <!-- Librerías 3D -->
    <script src="https://aframe.io/releases/1.4.2/aframe.min.js"></script>
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f7f7f7;
            color: #333;
        }

        /* ===== HEADER ===== */
        header {
            background: linear-gradient(135deg, #c62828, #ff5252);
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        header .logo {
            width: 110px;
            border-radius: 50%;
            border: 2px solid white;
            background-color: white;
            padding: 6px;
            margin-bottom: 10px;
        }

        header p {
            color: #fceaea;
        }

        /* ===== NAV ===== */
        nav {
            background-color: #2c2c2c;
            text-align: center;
            padding: 10px 0;
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            margin: 0 5px;
            display: inline-block;
            font-weight: 600;
            transition: background 0.3s;
            border-radius: 8px;
        }

        nav a:hover, nav a.active {
            background-color: #c62828;
        }

        /* ===== SECCIONES ===== */
        section {
            width: 85%;
            margin: 30px auto;
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.15);
        }

        section h2 {
            color: #c62828;
            margin-bottom: 10px;
        }

        section .intro {
            margin-bottom: 20px;
            font-size: 1.05em;
            color: #555;
        }

        /* ===== ESCENA VR ===== */
        a-scene {
            width: 100%;
            height: 80vh;
            display: block;
            border-radius: 20px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.25);
            margin-bottom: 30px;
        }

        /* ===== MODELOS ===== */
        .modelos {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 25px;
            margin-top: 25px;
        }

        .modelo {
            width: 300px;
            background-color: #fceaea;
            border-radius: 15px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            text-align: center;
            padding: 15px;
            transition: transform 0.4s, box-shadow 0.4s;
        }

        .modelo:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(198,40,40,0.3);
        }

        model-viewer {
            width: 100%;
            height: 250px;
            background: linear-gradient(135deg, #fff5f5, #ffecec);
            border-radius: 10px;
        }

        .modelo h4 {
            color: #c62828;
            margin: 10px 0 5px;
        }

        .modelo p {
            color: #555;
        }

        /* ===== CHAT ===== */
        .chat-toggle {
            position: fixed;
            bottom: 180px;
            right: 45px;
            background-color: #c62828;
            color: white;
            border: none;
            border-radius: 50%;
            width: 55px;
            height: 55px;
            font-size: 1.5em;
            cursor: pointer;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .chat-toggle:hover {
            background-color: #a31515;
        }

        .chat-box {
            position: fixed;
            bottom: 200px;
            right: 25px;
            width: 260px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.3);
            overflow: hidden;
            display: none;
            flex-direction: column;
        }

        .chat-header {
            background-color: #c62828;
            color: white;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        .chat-messages {
            height: 180px;
            overflow-y: auto;
            padding: 10px;
            font-size: 0.9em;
        }

        .bot-msg { text-align: left; color: #c62828; }
        .user-msg { text-align: right; color: #333; }

        .chat-input {
            display: flex;
            border-top: 1px solid #ddd;
        }

        .chat-input input {
            flex: 1;
            border: none;
            padding: 8px;
            font-size: 0.9em;
        }

        .chat-input button {
            background-color: #c62828;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }

        .chat-input button:hover {
            background-color: #a31515;
        }

        /* ===== FOOTER ===== */
        footer {
            background-color: #b71c1c;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
            font-size: 0.9em;
        }

        /* ===== MASCOTA ===== */
        .mascota-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 160px;
            height: 160px;
            z-index: 1000;
        }

        .mascota-container model-viewer {
            width: 160px;
            height: 160px;
        }
    </style>
</head>

<body>
<header>
    <img src="../image/logo.png" alt="Logo MediClick" class="logo">
    <h1>MediClick</h1>
    <p>Explora nuestros servicios dentro de la farmacia o con modelos 3D interactivos.</p>
</header>

<nav>
    <a href="index.jsp">Inicio</a>
    <a class="active" href="servicios.jsp">Servicios</a>
    <a href="productos.jsp">Productos</a>
</nav>

<!-- Escena VR -->
<a-scene embedded vr-mode-ui="enabled: true" renderer="antialias: true">
    <a-assets>
        <a-asset-item id="operRoom" src="../image/pharmacy.glb"></a-asset-item>
        <a-asset-item id="service1" src="../image/test_tube_mutations.glb"></a-asset-item>
        <a-asset-item id="service2" src="../image/bandaged_hand.glb"></a-asset-item>
        <a-asset-item id="service3" src="../image/medical_x_ray_image_viewer_200_uploads.glb"></a-asset-item>
    </a-assets>

    <a-entity light="type: ambient; intensity: 0.8"></a-entity>
    <a-entity light="type: directional; intensity: 0.6" position="0 10 2"></a-entity>

    <a-entity id="operatingRoom" gltf-model="#operRoom" position="30 0 -50" scale="1 1 1"></a-entity>

    <a-entity id="hotspot-1" class="hotspot" geometry="primitive:sphere;radius:0.12" material="color:#c62828;opacity:0.9" position="-1.5 1.1 -2.2"></a-entity>
    <a-entity id="hotspot-2" class="hotspot" geometry="primitive:sphere;radius:0.12" material="color:#ffb300;opacity:0.9" position="0.6 1.0 -1.0"></a-entity>
    <a-entity id="hotspot-3" class="hotspot" geometry="primitive:sphere;radius:0.12" material="color:#4caf50;opacity:0.9" position="2.0 1.2 -2.5"></a-entity>

    <a-entity id="cameraRig">
        <a-entity id="mainCamera" camera look-controls position="0 1.6 -3">
            <a-entity cursor="fuse:false;rayOrigin:mouse" raycaster="objects:.hotspot" position="0 0 -0.5"
                geometry="primitive:ring;radiusInner:0.01;radiusOuter:0.02" material="color:white;shader:flat"></a-entity>
        </a-entity>
    </a-entity>
</a-scene>

<!-- Modelos interactivos -->
<section>
    <h2>Servicios 3D Interactivos</h2>
    <p class="intro">Explora nuestros servicios médicos más destacados en 3D.</p>
    <div class="modelos">
        <div class="modelo">
            <model-viewer src="../image/presion.glb" alt="Exámenes de Sangre" camera-controls auto-rotate ar></model-viewer>
            <h4>Toma de presión arterial</h4>
            <p>Monitoreo rápido y gratuito o con bajo costo.</p>
        </div>
        <div class="modelo">
            <model-viewer src="../image/covid.glb" alt="Rehabilitación" camera-controls auto-rotate ar></model-viewer>
            <h4>Test de embarazo o COVID-19</h4>
            <p>Realizados en la farmacia o con asesoría profesional.</p>
        </div>
        <div class="modelo">
            <model-viewer src="../image/pesa.glb" alt="Rayos X" camera-controls auto-rotate ar></model-viewer>
            <h4>Indice de masa corporal (IMC)</h4>
            <p>Control del estado físico general.</p>
        </div>
    </div>
</section>

<div class="mascota-container">
    <model-viewer src="../image/mascota.glb" alt="Mascota MediClick" auto-rotate camera-controls></model-viewer>
</div>

<button class="chat-toggle">💬</button>

<div class="chat-box" id="chatBox">
    <div class="chat-header">Asistente MediClick</div>
    <div class="chat-messages" id="chatMessages">
        <div class="bot-msg">¡Hola! 😊 ¿En qué puedo ayudarte hoy?</div>
    </div>
    <div class="chat-input">
        <input type="text" id="userInput" placeholder="Escribe tu mensaje...">
        <button id="sendBtn">Enviar</button>
    </div>
</div>

<footer>
    <p>&copy; 2025 MediClick - Todos los derechos reservados.</p>
</footer>
</body>
</html>
