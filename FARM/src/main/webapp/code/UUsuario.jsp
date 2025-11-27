<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.productos.seguridad.*,javax.servlet.http.HttpSession" %>

<%
    // === Seguridad de sesión y perfil ===
    HttpSession ses = request.getSession(false);
    if (ses == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Integer perfil = (Integer) ses.getAttribute("perfil");
    if (perfil == null || perfil != 1) { // Solo Admin
        response.sendRedirect("menu.jsp");
        return;
    }

    String usuarioSesion = (String) ses.getAttribute("usuario");
    if (usuarioSesion == null) usuarioSesion = "Administrador";

    // === Menú dinámico ===
    Pagina pagina = new Pagina();
    String menuHtml = pagina.mostrarMenu(perfil);

    // === Tabla de usuarios ===
    Usuario u = new Usuario();
    String tablaHtml = u.consultarUsuariosConUltimoIngreso();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Usuarios - Últimos ingresos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap 5.3.8 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
    <div class="container py-4">

        <!-- Encabezado -->
        <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between mb-3">
            <div>
                <h2 class="mb-1">Usuarios del sistema</h2>
                <p class="text-muted mb-0">Administración · Verificación de último ingreso</p>
            </div>
            <div class="mt-3 mt-md-0">
                <span class="badge bg-primary">Admin: <%= usuarioSesion %></span>
            </div>
        </div>
        <!-- Tabla -->
        <div class="card shadow-sm">
            <div class="card-body">
                <div class="table-responsive">
                    <%= tablaHtml %>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

