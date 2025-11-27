<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.productos.negocio.ItemCarrito" %>
<%@ page import="java.util.ArrayList" %>

<%
    // ================= DATOS DE SESIÓN =================
    String usuarioMenu = (String) session.getAttribute("usuario");
    if (usuarioMenu == null) usuarioMenu = "Invitado";
    
    Integer perfilMenu = (Integer) session.getAttribute("perfil");
    
    Date horaLoginMenu = (Date) session.getAttribute("horaLogin");
    if (horaLoginMenu == null) {
        horaLoginMenu = new Date(session.getCreationTime());
    }
    
    String fechaFormateadaMenu =
        new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(horaLoginMenu);

    // ========== CONTADOR DEL CARRITO ==========
    int totalItemsCarrito = 0;

    if (perfilMenu != null && perfilMenu == 2) { // solo clientes

        ArrayList<ItemCarrito> carritoSesion =
            (ArrayList<ItemCarrito>) session.getAttribute("carrito");

        if (carritoSesion != null) {
            for (ItemCarrito item : carritoSesion) {
                totalItemsCarrito += item.getCantidad();
            }
        }
    }
%>

<!-- ================= NAVBAR PARA TODOS ================= -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MediClick</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav me-auto">

                <!-- ========= MENÚ ADMINISTRADOR ========= -->
                <% if (perfilMenu != null && perfilMenu == 1) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="adminUsuarios.jsp">Administrar Usuarios</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Bitacora.jsp">Bitácora</a>
                    </li>
                <% } %>

				 <!-- ========= MENÚ CLIENTE ========= -->
				<% if (perfilMenu != null && perfilMenu == 2) { %>
				
				    <li class="nav-item">
				        <a class="nav-link" href="productosCliente.jsp">Productos</a>
				    </li>
				
				    <li class="nav-item">
				        <a class="nav-link" href="carrito.jsp">
				            🛒 Carrito 
				            <% if (totalItemsCarrito > 0) { %>
				                <span class="badge bg-danger"><%= totalItemsCarrito %></span>
				            <% } %>
				        </a>
				    </li>
				
				<% } %>


                <!-- ========= MENÚ VENDEDOR ========= -->
                <% if (perfilMenu != null && perfilMenu == 3) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="PProductos.jsp">Administrar Producto</a>
                    </li>
                <% } %>

            </ul>

            <span class="navbar-text text-white me-3">
                Usuario: <strong><%= usuarioMenu %></strong>
            </span>

            <a href="cerrarSesion.jsp" class="btn btn-danger">Cerrar Sesion</a>
        </div>
    </div>
</nav>

<!-- ================= TARJETA DE BIENVENIDA ================= -->
<div class="container">
    <h2>Bienvenido al Sistema</h2>
    <hr>

    <div class="alert alert-light border d-flex flex-column gap-1" role="alert">
        <div><strong>Usuario:</strong> <%= usuarioMenu %></div>
        <div><strong>Inicio de sesion:</strong> <%= fechaFormateadaMenu %></div>
    </div>
</div>
