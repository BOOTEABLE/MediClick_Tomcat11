<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Administrador</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ======== HEADER ESTILO ADMIN ======== */
        header {
            background: linear-gradient(135deg, #0d47a1, #1976d2);
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.4);
        }

        header .logo {
            width: 120px;
            border-radius: 50%;
            border: 3px solid #bbdefb;
            background-color: white;
            padding: 8px;
            margin-bottom: 10px;
        }

        /* ======== NAV ADMIN ======== */
        nav {
            display: flex;
            justify-content: center;
            background-color: #0d47a1;
            box-shadow: 0 3px 10px rgba(0,0,0,0.35);
        }

        nav a, nav form button {
            text-decoration: none;
            color: white;
            padding: 15px 25px;
            font-weight: 600;
            transition: 0.3s;
            border-radius: 8px;
        }

        nav a:hover {
            background-color: #1565c0;
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <header>
        <img src="../image/logo.png" class="logo">
        <h1>Panel Administrativo</h1>
        <h2>Gestión Interna del Sistema</h2>
    </header>

    <!-- MENU -->
    <%@ include file="menu.jsp" %>

    <!-- CONTENIDO -->
    <div class="container mt-4">
        <h2>Panel del Administrador</h2>
        <p>Bienvenido. Aquí puedes administrar usuarios del sistema.</p>
    </div>

</body>
</html>
