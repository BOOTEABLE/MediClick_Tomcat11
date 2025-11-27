<%@ page import="com.productos.negocio.Producto" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id_pr"));
    int id_cat = Integer.parseInt(request.getParameter("id_cat"));
    String nombre = request.getParameter("nombre");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precio = Double.parseDouble(request.getParameter("precio"));

    Producto p = new Producto().obtenerPorId(id);

    // FOTO
    Part foto = request.getPart("foto");
    String nombreFoto = p.getFoto_pr(); // mantener actual

    if (foto != null && foto.getSize() > 0) {
        nombreFoto = foto.getSubmittedFileName();
        String ruta = application.getRealPath("/") + "image/";
        Files.copy(foto.getInputStream(), new File(ruta + nombreFoto).toPath());
    }

    // Actualizar
    p.setId_cat(id_cat);
    p.setNombre_pr(nombre);
    p.setCantidad_pr(cantidad);
    p.setPrecio_pr(precio);
    p.setFoto_pr(nombreFoto);

    String msg = p.actualizar();
%>

<script>
    alert("<%= msg %>");
    window.location="PProductos.jsp";
</script>
