<%@ page import="java.util.ArrayList" %>
<%@ page import="com.productos.negocio.ItemCarrito" %>

<%
    ArrayList<ItemCarrito> carrito =
        (ArrayList<ItemCarrito>) session.getAttribute("carrito");

    if (carrito == null) carrito = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>

    <style>
        body { background: #fff5f5; }
        .mini {
            width: 70px;
            height: 70px;
            display: flex;
            background: #f3f3f3;
            border-radius: 10px;
            justify-content:center;
            align-items:center;
            overflow:hidden;
        }
        img { width:100%; height:100%; object-fit:contain; }
        model-viewer { width:100%; height:100%; }
    </style>
</head>

<body>

<%@ include file="menu.jsp" %>

<div class="container mt-4">
    <h2>🛒 Mi Carrito</h2>
    <hr>

    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Foto</th>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cant.</th>
                <th>Subtotal</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            <%
                double total = 0;

                for(ItemCarrito item : carrito) {
                    total += item.getSubtotal();

                    String archivo = item.getFoto();
                    String ext = archivo.substring(archivo.lastIndexOf(".") + 1).toLowerCase();
            %>

            <tr>
                <td>
                    <div class="mini">
                        <% if(ext.equals("png") || ext.equals("jpg") || ext.equals("jpeg") || ext.equals("gif")) { %>
                            <img src="<%= request.getContextPath() %>/image/<%= archivo %>">
                        <% } else if(ext.equals("glb")) { %>
                            <model-viewer src="<%= request.getContextPath() %>/image/<%= archivo %>"
                                          auto-rotate disable-zoom></model-viewer>
                        <% } %>
                    </div>
                </td>

                <td><%= item.getNombre() %></td>
                <td>$ <%= item.getPrecio() %></td>
                <td><%= item.getCantidad() %></td>
                <td>$ <%= item.getSubtotal() %></td>

                <td>
                    <a href="eliminarDelCarrito.jsp?id=<%= item.getId() %>" 
                       class="btn btn-danger btn-sm">Quitar</a>
                </td>
            </tr>

            <% } %>
        </tbody>
    </table>

    <h3>Total a pagar: $<%= total %></h3>

    <a href="finalizarSimulado.jsp" class="btn btn-success mt-3">Finalizar Compra</a>

</div>

</body>
</html>
