<%@ page import="com.productos.negocio.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Producto p = new Producto().obtenerPorId(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Producto</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .form-container {
            max-width: 550px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }
        .btn-guardar {
            background: #d32f2f;
            color: white;
        }
        .btn-guardar:hover {
            background: #b71c1c;
        }
    </style>
</head>

<body>

<%@ include file="menu.jsp" %>

<div class="form-container">

    <h3 class="text-center mb-4">Editar Producto</h3>

    <form method="post" action="actualizarProductoProceso.jsp" enctype="multipart/form-data">

        <input type="hidden" name="id_pr" value="<%= p.getId_pr() %>">

        <label>Categoría:</label>
        <select name="id_cat" class="form-select">
            <option value="1" <%= p.getId_cat()==1?"selected":"" %>>Insumos Médicos</option>
            <option value="2" <%= p.getId_cat()==2?"selected":"" %>>Medicinas</option>
            <option value="3" <%= p.getId_cat()==3?"selected":"" %>>Otros</option>
        </select>
        <br>

        <label>Nombre:</label>
        <input type="text" name="nombre" class="form-control" value="<%= p.getNombre_pr() %>">
        <br>

        <label>Cantidad:</label>
        <input type="number" name="cantidad" class="form-control" value="<%= p.getCantidad_pr() %>">
        <br>

        <label>Precio:</label>
        <input type="number" step="0.01" name="precio" class="form-control" value="<%= p.getPrecio_pr() %>">
        <br>

        <label>Foto actual:</label><br>
        <img src="image/<%= p.getFoto_pr() %>" width="120" style="border-radius:10px;">
        <br><br>

        <label>Nueva foto (opcional):</label>
        <input type="file" name="foto" class="form-control">
        <br>

        <button class="btn btn-guardar w-100">Actualizar Producto</button>

    </form>

</div>

</body>
</html>
