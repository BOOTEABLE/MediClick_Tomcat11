<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Cliente</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ======== ESTILOS DEL HEADER (De tu página principal) ======== */
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

        /* ======== ESTILO NAV (igual a tu página principal) ======== */
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
    </style>
</head>
<body>

    <!-- === Header con tu logo y títulos === -->
    <header>
        <img src="../image/logo.png" alt="Logo MediClick" class="logo">
        <h1>MediClick</h1>
        <h2>Tu salud, nuestra prioridad</h2>
    </header>

    <!-- === Menú dinámico (rol) con tu estilo de NAV === -->
    <%@ include file="menu.jsp" %>

    <!-- === Contenido de la página === -->
    <div class="container mt-4">
        <h2>Panel del Cliente</h2>
        <p>Aquí puedes ver tu carrito de compras y realizar pedidos.</p>
    </div>

</body>
</html>
