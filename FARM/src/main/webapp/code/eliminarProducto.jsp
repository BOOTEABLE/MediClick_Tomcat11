<%@ page import="com.productos.negocio.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Producto p = new Producto();
    String msg = p.eliminar(id);
%>

<script>
    alert("<%= msg %>");
    window.location="PProductos.jsp";
</script>
