<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.Auditoria"%>

<%
    // === Seguridad de sesión ===
    HttpSession ses = request.getSession(false);
    if (ses == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Integer perfil = (Integer) ses.getAttribute("perfil");
    if (perfil == null || perfil != 1) {
        response.sendRedirect("menu.jsp");
        return;
    }

    String usuarioSesion = (String) ses.getAttribute("usuario");
    if (usuarioSesion == null) usuarioSesion = "Administrador";

    // === Parámetros de búsqueda ===
    String fechaDesde = request.getParameter("fechaDesde");
    String fechaHasta = request.getParameter("fechaHasta");
    String tabla = request.getParameter("tabla");
    String usuario = request.getParameter("usuario");
    String operacion = request.getParameter("operacion");

    // === Llamar al backend ===
    Auditoria aud = new Auditoria();
    String tablaHtml = aud.consultarAuditoria(fechaDesde, fechaHasta, tabla, usuario, operacion);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Bitácora del Sistema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
<div class="container py-4">

    <h2 class="mb-3">Bitácora del sistema</h2>
    <p class="text-muted mb-4">Registros de auditoría automáticos</p>

    <!-- FILTROS -->
    <form method="GET" class="card p-3 mb-4 shadow-sm">

        <div class="row g-3">

            <div class="col-md-3">
                <label class="form-label">Fecha desde</label>
                <input type="date" name="fechaDesde" class="form-control" value="<%= fechaDesde == null ? "" : fechaDesde %>">
            </div>

            <div class="col-md-3">
                <label class="form-label">Fecha hasta</label>
                <input type="date" name="fechaHasta" class="form-control" value="<%= fechaHasta == null ? "" : fechaHasta %>">
            </div>

            <div class="col-md-3">
                <label class="form-label">Tabla</label>
                <input type="text" name="tabla" class="form-control" placeholder="ej: tb_usuario" value="<%= tabla == null ? "" : tabla %>">
            </div>

            <div class="col-md-3">
                <label class="form-label">Usuario</label>
                <input type="text" name="usuario" class="form-control" placeholder="usuario" value="<%= usuario == null ? "" : usuario %>">
            </div>

            <div class="col-md-3">
                <label class="form-label">Operación</label>
                <select name="operacion" class="form-select">
                    <option value="">Todas</option>
                    <option value="I" <%= "I".equals(operacion) ? "selected" : "" %>>Insert</option>
                    <option value="U" <%= "U".equals(operacion) ? "selected" : "" %>>Update</option>
                    <option value="D" <%= "D".equals(operacion) ? "selected" : "" %>>Delete</option>
                </select>
            </div>

        </div>

        <div class="mt-3">
            <button class="btn btn-primary">Buscar</button>
            <a href="Bitacora.jsp" class="btn btn-secondary">Limpiar</a>
        </div>
    </form>


    <!-- TABLA -->
    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <%= tablaHtml %>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
