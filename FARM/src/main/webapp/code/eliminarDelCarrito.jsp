<%@ page import="java.util.ArrayList" %>
<%@ page import="com.productos.negocio.ItemCarrito" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    ArrayList<ItemCarrito> carrito =
        (ArrayList<ItemCarrito>) session.getAttribute("carrito");

    if (carrito != null)
        carrito.removeIf(item -> item.getId() == id);

    response.sendRedirect("carrito.jsp");
%>
