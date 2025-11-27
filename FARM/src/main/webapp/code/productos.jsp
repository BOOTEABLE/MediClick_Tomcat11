<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos - MediClick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <style>
        body {
            background-color: #fff5f5;
            font-family: 'Segoe UI', sans-serif;
        }

        /* Header */
        header {
            background: linear-gradient(135deg, #c21807, #d32f2f);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        header img {
            width: 100px;
        }

        header h1 {
            font-weight: bold;
            color: #ffffff;
        }

        header h2 {
            color: #ffeaea;
        }

        /* Navbar */
        nav.navbar {
            background: #2c2c2c;
        }

        nav .nav-link {
            color: white !important;
            font-weight: 500;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s, color 0.3s;
            margin: 0 5px;
        }

        nav .nav-link:hover {
            background-color: #e53935;
            color: #fff !important;
        }

        nav .nav-link.active {
            background-color: #ff5252;
            color: #fff !important;
            font-weight: bold;
        }

        /* Sección productos */
        section h2 {
            color: #b71c1c;
            font-weight: bold;
        }

        section p {
            color: #444;
            font-size: 1.05em;
        }

        /* Tarjetas */
        .card {
            border: none;
            border-radius: 20px;
            background: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }

        model-viewer {
            width: 100%;
            height: 300px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            background-color: #fff0f0;
        }

        .card-title {
            color: #d32f2f;
            font-weight: 600;
        }

        footer {
            background-color: #b71c1c;
            color: white;
            padding: 15px 0;
            font-size: 0.9em;
            text-align: center;
        }
    </style>
</head>
<body>

<header class="text-center py-4 text-white">
    <img src="../image/logo2.png" alt="Logo MediVital" class="rounded-circle mb-2">
    <h1>MediClick</h1>
    <h2 class="fw-light">Productos al 50% todos los martes</h2>
</header>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container justify-content-center">
        <a class="nav-link" href="index.jsp">Inicio</a>
        <a class="nav-link" href="servicios.jsp">Servicios</a>
        <a class="nav-link active" href="productos.jsp">Productos</a>
    </div>
</nav>

<section class="container my-5">
    <h2 class="text-center mb-4">Catálogo de Productos 3D</h2>
    <p class="text-center mb-5">Visualiza nuestros productos médicos en 3D. Puedes rotar, acercar y explorar cada modelo interactivo.</p>

    <div class="row g-4">
        <!-- Producto 1 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/jeringa.glb" alt="Camilla hospitalaria" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Jeringa</h5>
                    <p>Tubo cilíndrico con un émbolo que se usa para administrar o extraer líquidos</p>
                </div>
            </div>
        </div>

        <!-- Producto 2 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/panal.glb" alt="Estetoscopio" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Pañal Huggers</h5>
                    <p>Prenda interior absorbente usada para higienizar.</p>
                </div>
            </div>
        </div>

        <!-- Producto 3 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/medicina.glb" alt="Jeringa médica" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Fluimucil</h5>
                    <p>Medicina Segura.</p>
                </div>
            </div>
        </div>

        <!-- Producto 4 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/facemasks.glb" alt="Mascarilla médica" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Mascarilla Médica</h5>
                    <p>Protección respiratoria de múltiples capas, cómoda y segura.</p>
                </div>
            </div>
        </div>

        <!-- Producto 5 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/thermometer.glb" alt="Termómetro digital" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Termómetro Digital</h5>
                    <p>Medición rápida y precisa de la temperatura corporal.</p>
                </div>
            </div>
        </div>

        <!-- Producto 6 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/bandage.glb" alt="Vendas médicas" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Vendas Médicas</h5>
                    <p>Material flexible y resistente, ideal para curaciones.</p>
                </div>
            </div>
        </div>

        <!-- Producto 7 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/pills.glb" alt="Frasco de medicinas" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Frasco de Medicinas</h5>
                    <p>Envase hermético ideal para almacenamiento de fármacos.</p>
                </div>
            </div>
        </div>

        <!-- Producto 8 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/scalpel.glb" alt="Bisturí quirúrgico" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Bisturí Quirúrgico</h5>
                    <p>Instrumento de acero inoxidable para cortes precisos.</p>
                </div>
            </div>
        </div>

        <!-- Producto 9 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/glove.glb" alt="Guantes médicos" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Guantes de Látex</h5>
                    <p>Protección completa durante procedimientos clínicos.</p>
                </div>
            </div>
        </div>

        <!-- Producto 10 -->
        <div class="col-md-4">
            <div class="card">
                <model-viewer src="../image/iv_bag.glb" alt="Bolsa de suero" camera-controls auto-rotate ar></model-viewer>
                <div class="card-body text-center">
                    <h5 class="card-title">Bolsa de Suero</h5>
                    <p>Bolsa estéril de uso hospitalario para suministro intravenoso.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<footer>
    <p>&copy; 2025 MediClick - Todos los derechos reservados.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
