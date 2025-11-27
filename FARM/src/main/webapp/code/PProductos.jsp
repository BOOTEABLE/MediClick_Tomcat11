<%@ page import="com.productos.negocio.Producto" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Vendedor - Productos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- model-viewer para archivos .glb -->
    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <style>
        body {
            background: #fff5f5;
            font-family: 'Segoe UI', sans-serif;
        }

        /* HEADER */
        header {
            background: linear-gradient(135deg, #ff9800, #ffb74d);
            color: white;
            text-align: center;
            padding: 30px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.25);
            margin-bottom: 10px;
        }

        header .logo {
            width: 120px;
            border-radius: 50%;
            border: 3px solid #ffe0b2;
            background-color: white;
            padding: 8px;
            margin-bottom: 10px;
        }

        /* TABLA */
        .table td, .table th { vertical-align: middle; }

        .foto-mini {
            width: 70px;
            height: 70px;
            border-radius: 10px;
            background-color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .foto-mini img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .foto-mini model-viewer {
            width: 100%;
            height: 100%;
        }

        .btn-nuevo {
            background: #d32f2f;
            color: white;
        }
        .btn-nuevo:hover {
            background: #b71c1c;
            color: white;
        }
    </style>
</head>

<body>

<!-- =========================== -->
<!--      HEADER PRINCIPAL       -->
<!-- =========================== -->
<header>
    <img src="../image/logo.png" class="logo">
    <h1>Panel del Vendedor</h1>
    <h2 style="font-weight:300;">Gestión de Productos e Inventarios</h2>
</header>

<!-- =========================== -->
<!--          MENÚ               -->
<!-- =========================== -->
<%@ include file="menu.jsp" %>

<!-- =========================== -->
<!--     CONTENIDO PRINCIPAL     -->
<!-- =========================== -->
<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Administrar Productos</h3>

        <!-- BOTÓN NUEVO PRODUCTO -->
        <a href="registrarProducto.jsp" class="btn btn-nuevo">
            + Registrar Producto
        </a>
    </div>

    <!-- TABLA DE PRODUCTOS -->
    <table class="table table-bordered table-striped text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Categoría</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Foto / Modelo</th>
                <th>Acciones</th>
            </tr>
        </thead>

        <tbody>
            <%
                Producto prod = new Producto();
                ResultSet rs = prod.listar();
                NumberFormat nf = NumberFormat.getCurrencyInstance();

                while (rs != null && rs.next()) {
                    String archivo = rs.getString("foto_pr");
                    String ext = archivo.substring(archivo.lastIndexOf(".") + 1).toLowerCase();
            %>

            <tr>
                <td><%= rs.getInt("id_pr") %></td>
                <td><%= rs.getInt("id_cat") %></td>
                <td><%= rs.getString("nombre_pr") %></td>
                <td><%= rs.getInt("cantidad_pr") %></td>
                <td><%= nf.format(rs.getDouble("precio_pr")) %></td>

                <!-- FOTO / MODELO -->
                <td>
                    <div class="foto-mini">
                        <% if(ext.equals("png") || ext.equals("jpg") || ext.equals("jpeg") || ext.equals("gif")) { %>

                            <img src="<%= request.getContextPath() %>/image/<%= archivo %>">

                        <% } else if(ext.equals("glb")) { %>

                            <model-viewer src="<%= request.getContextPath() %>/image/<%= archivo %>"
                                          camera-controls
                                          disable-pan
                                          disable-zoom
                                          auto-rotate>
                            </model-viewer>

                        <% } else { %>
                            <span class="text-muted">No soportado</span>
                        <% } %>
                    </div>
                </td>

                <td>
                    <a href="actualizarProducto.jsp?id=<%= rs.getInt("id_pr") %>"
                       class="btn btn-warning btn-sm">
                        Editar
                    </a>

                    <a href="eliminarProducto.jsp?id=<%= rs.getInt("id_pr") %>"
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('¿Seguro que deseas eliminar este producto?');">
                        Eliminar
                    </a>
                </td>
            </tr>

            <% } %>

        </tbody>
    </table>

</div>

</body>
</html>
