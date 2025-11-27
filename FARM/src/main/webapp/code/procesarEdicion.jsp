<%@ page import="com.productos.seguridad.Usuario" %>
<%

int id = Integer.parseInt(request.getParameter("id"));
String nombre = request.getParameter("nombre");
String cedula = request.getParameter("cedula");
String correo = request.getParameter("correo");
String clave = request.getParameter("clave");
int perfil = Integer.parseInt(request.getParameter("perfil"));
int estado = Integer.parseInt(request.getParameter("estado"));

Usuario u = new Usuario();
u.setId(id);
u.setNombre(nombre);
u.setCedula(cedula);
u.setCorreo(correo);
u.setClave(clave);
u.setPerfil(perfil);
u.setEstado(estado);

String msg = u.actualizarUsuario();
%>

<script>
alert("<%= msg %>");
window.location = "adminUsuarios.jsp";
</script>
