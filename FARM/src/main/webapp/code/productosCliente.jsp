<%@ page import="com.productos.negocio.Producto" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Productos - Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <script type="module"
        src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js">
    </script>

    <style>
        body { background: #fff5f5; }
        .card { border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1); }
        .mini { height: 200px; }
    </style>
</head>

<body>

<%@ include file="menu.jsp" %>

<div class="container mt-4">
    <h2 class="text-center mb-4">Catálogo de Productos</h2>

    <div class="row g-4">

        <%
            Producto p = new Producto();
            ResultSet rs = p.listar();

            while(rs != null && rs.next()) {
                String archivo = rs.getString("foto_pr");
                String ext = archivo.substring(archivo.lastIndexOf(".")+1).toLowerCase();
        %>

        <div class="col-md-4">
            <div class="card p-3 text-center">

                <div class="mini">

				    <% if(ext.equals("jpg") || ext.equals("png") || ext.equals("jpeg") || ext.equals("gif")) { %>
				
				        <img src="<%= request.getContextPath() %>/image/<%= archivo %>" 
				             class="img-fluid">
				
				    <% } else if(ext.equals("glb")) { %>
				
				        <model-viewer src="<%= request.getContextPath() %>/image/<%= archivo %>" 
				                      camera-controls auto-rotate>
				        </model-viewer>
				
				    <% } %>
				
				</div>


                <h5 class="mt-3"><%= rs.getString("nombre_pr") %></h5>
                <p>Precio: $<%= rs.getDouble("precio_pr") %></p>

                <a href="agregarCarrito.jsp?id=<%= rs.getInt("id_pr") %>" 
                   class="btn btn-success w-100">
                    🛒 Agregar al Carrito
                </a>

            </div>
        </div>

        <% } %>

    </div>
</div>

</body>
</html>
