<%@ page import="com.productos.negocio.Producto" %>
<%@ page import="jakarta.servlet.http.Part" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String id_cat = request.getParameter("id_cat");
    String nombre = request.getParameter("nombre");
    String cantidad = request.getParameter("cantidad");
    String precio = request.getParameter("precio");

    // Validación
    if (id_cat == null || nombre == null || cantidad == null || precio == null ||
        id_cat.isEmpty() || nombre.isEmpty() || cantidad.isEmpty() || precio.isEmpty()) {
        
        out.println("<script>alert('Todos los campos son obligatorios'); window.location='registrarProducto.jsp';</script>");
        return;
    }

    // Procesar imagen
    Part foto = request.getPart("foto");
    String nombreFoto = "sin_foto.png";

    if (foto != null && foto.getSize() > 0) {
        nombreFoto = foto.getSubmittedFileName();
        String rutaCarpeta = application.getRealPath("/") + "image/";

        File carpeta = new File(rutaCarpeta);
        if (!carpeta.exists()) carpeta.mkdirs();

        Files.copy(foto.getInputStream(), new File(rutaCarpeta + nombreFoto).toPath());
    }

    // Guardar en la BD
    Producto p = new Producto();
    p.setId_cat(Integer.parseInt(id_cat));
    p.setNombre_pr(nombre);
    p.setCantidad_pr(Integer.parseInt(cantidad));
    p.setPrecio_pr(Double.parseDouble(precio));
    p.setFoto_pr(nombreFoto);

    String msg = p.insertar();
%>

<script>
    alert("<%= msg %>");
    window.location="PProductos.jsp";
</script>
