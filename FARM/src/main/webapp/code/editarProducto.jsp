<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="menu.jsp" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
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
        .card {
            margin-top: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            border-radius: 12px;
            padding: 20px;
        }
        img { border-radius: 10px; }
    </style>
</head>

<body>

<header>
    <img src="../image/logo.png" class="logo">
    <h1>Panel del Vendedor</h1>
    <h2>Editar Producto</h2>
</header>

<div class="container mt-4">
    <div class="row justify-content-center">

        <div class="col-lg-6 col-md-8">
            <div class="card">

                <%
                    String id = request.getParameter("id");

                    if (id == null) {
                        out.println("<script>alert('ID inválido'); window.location='PProductos.jsp';</script>");
                        return;
                    }

                    Conexion cn = new Conexion();
                    Connection con = cn.getConexion();

                    String sql = "SELECT * FROM tb_producto WHERE id_pr = ?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1, Integer.parseInt(id));
                    ResultSet rs = ps.executeQuery();

                    String nombre = "", foto = "";
                    int idCategoria = 0, cantidad = 0;
                    double precio = 0;

                    if (rs.next()) {
                        nombre = rs.getString("nombre_pr");
                        cantidad = rs.getInt("cantidad_pr");
                        precio = rs.getDouble("precio_pr");
                        foto = rs.getString("foto_pr");
                        idCategoria = rs.getInt("id_cat");
                    } else {
                        out.println("<script>alert('Producto no encontrado'); window.location='PProductos.jsp';</script>");
                        return;
                    }
                %>

                <h4 class="mb-3 text-center">Editar Producto</h4>

                <form action="actualizarProducto.jsp" method="post">

    <input type="hidden" name="id" value="<%= id %>">

    <div class="mb-3">
        <label class="form-label">Categoría:</label>
        <select name="id_cat" class="form-select">
            <%
                ResultSet rsCat = con.createStatement().executeQuery("SELECT * FROM tb_categoria");
                while (rsCat.next()) {
                    int idcat = rsCat.getInt("id_cat");
            %>
                <option value="<%= idcat %>" <%= (idcat == idCategoria ? "selected" : "") %>>
                    <%= rsCat.getString("descripcion_cat") %>
                </option>
            <% } %>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Nombre:</label>
        <input type="text" name="nombre" class="form-control" value="<%= nombre %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Cantidad:</label>
        <input type="number" name="cantidad" class="form-control" value="<%= cantidad %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Precio:</label>
        <input type="number" step="0.01" name="precio" class="form-control" value="<%= precio %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Cambiar foto (opcional):</label>
        <input type="file" name="foto" class="form-control">
    </div>

    <button type="submit" class="btn btn-warning w-100">Actualizar Producto</button>
</form>

            </div>
        </div>

    </div>
</div>

</body>
</html>
