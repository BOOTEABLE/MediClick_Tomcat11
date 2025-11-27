<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Vendedor</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ======== HEADER VENDEDOR ======== */
        header {
            background: linear-gradient(135deg, #ff9800, #ffb74d);
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.25);
        }

        header .logo {
            width: 120px;
            border-radius: 50%;
            border: 3px solid #ffe0b2;
            background-color: white;
            padding: 8px;
            margin-bottom: 10px;
        }

        /* ======== NAV VENDEDOR ======== */
        nav {
            display: flex;
            justify-content: center;
            background-color: #ef6c00;
            box-shadow: 0 3px 10px rgba(0,0,0,0.25);
        }

        nav a, nav form button {
            text-decoration: none;
            color: white;
            padding: 15px 25px;
            font-weight: 600;
            border-radius: 8px;
            transition: 0.3s;
        }

        nav a:hover {
            background-color: #f57c00;
        }
    </style>
</head>

<body>

    <!-- HEADER -->
    <header>
        <img src="../image/logo.png" class="logo">
        <h1>Panel del Vendedor</h1>
        <h2>Gestión de Productos e Inventarios</h2>
    </header>

    <!-- MENU -->
    <%@ include file="menu.jsp" %>

    <!-- CONTENIDO -->
    <div class="container mt-4">
        <h2>Panel del Vendedor</h2>
        <p>Aquí puedes administrar tus productos y actualizar inventarios.</p>
    </div>

</body>
</html>
