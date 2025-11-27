<%@ page import="com.productos.seguridad.Usuario" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Usuario u = new Usuario();
    String msg = u.eliminarUsuario(id);
%>

<script>
alert("<%= msg %>");
window.location = "adminUsuarios.jsp";
</script>
