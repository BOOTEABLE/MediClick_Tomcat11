<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("clave");

    Conexion cn = new Conexion();
    Connection con = cn.getConexion();

    try {
        if (con != null) {
            String sql = "SELECT * FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // === Guardar datos en sesión ===
                session.setAttribute("usuario", rs.getString("nombre_us"));
                session.setAttribute("perfil", rs.getInt("id_per")); // 🔥 IMPORTANTE

                int perfil = rs.getInt("id_per");

                // === Redirección según el rol ===
                if (perfil == 1) {
                    // Admin
                    out.println("<script>window.location='admin.jsp';</script>");
                } else if (perfil == 2) {
                    // Cliente
                    out.println("<script>window.location='CCliente.jsp';</script>");
                } else if (perfil == 3) {
                    // Vendedor
                    out.println("<script>window.location='vendedor.jsp';</script>");
                } else {
                    // Por si acaso
                    out.println("<script>");
                    out.println("alert('Perfil no reconocido');");
                    out.println("window.location='login.jsp';");
                    out.println("</script>");
                }

            } else {
                out.println("<script>");
                out.println("alert('Usuario o contraseña incorrectos');");
                out.println("window.location='login.jsp';");
                out.println("</script>");
            }

            rs.close();
            ps.close();
            con.close();
        } else {
            out.println("<script>");
            out.println("alert('Error de conexión a la base de datos');");
            out.println("window.location='login.jsp';");
            out.println("</script>");
        }
    } catch (Exception e) {
        out.println("<script>");
        out.println("alert('Error: " + e.getMessage() + "');");
        out.println("window.location='login.jsp';");
        out.println("</script>");
    }
%>
