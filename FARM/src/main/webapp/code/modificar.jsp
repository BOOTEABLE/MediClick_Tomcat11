<%@ page import="com.productos.seguridad.Usuario" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Usuario u = new Usuario().obtenerPorId(id);
%>

<!DOCTYPE html>
<html>
<head>
<title>Editar Usuario</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<h2>Editar Usuario</h2>
<form action="procesarEdicion.jsp" method="post">

    <input type="hidden" name="id" value="<%= u.getId() %>" />

    Nombre:
    <input type="text" name="nombre" class="form-control" value="<%= u.getNombre() %>" required><br>

    Cédula:
    <input type="text" name="cedula" class="form-control" value="<%= u.getCedula() %>" required><br>

    Correo:
    <input type="email" name="correo" class="form-control" value="<%= u.getCorreo() %>" required><br>

    Clave:
    <input type="text" name="clave" class="form-control" value="<%= u.getClave() %>" required><br>

    Perfil:
    <select name="perfil" class="form-control">
        <option value="1" <%= u.getPerfil()==1 ? "selected" : "" %>>Administrador</option>
        <option value="2" <%= u.getPerfil()==2 ? "selected" : "" %>>Cliente</option>
        <option value="3" <%= u.getPerfil()==3 ? "selected" : "" %>>Vendedor</option>
    </select><br>

    Estado:
    <select name="estado" class="form-control">
        <option value="1" <%= u.getEstado()==1 ? "selected" : "" %>>Activo</option>
        <option value="0" <%= u.getEstado()==0 ? "selected" : "" %>>Inactivo</option>
    </select><br>

    <button class="btn btn-success">Actualizar</button>
    <a href="adminUsuarios.jsp" class="btn btn-secondary">Cancelar</a>
</form>

</body>
</html>
