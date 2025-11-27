<%@ page import="java.sql.*, com.productos.datos.Conexion" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    String estado = request.getParameter("cmbEstado");  // 🔥 ESTADO CIVIL
	
    // -------------------------------
    // VALIDACIONES ANTES DE GUARDAR
    // -------------------------------

    // Validación: correo con formato correcto
    String regexCorreo = "^[A-Za-z0-9+_.-]+@(.+)$";
    if (correo == null || !correo.matches(regexCorreo)) {
    	response.sendRedirect("registrarCliente.jsp?msg=correoInvalido");
        return;
    }

    // Validación: clave mínima de 6 caracteres
    if (clave == null || clave.length() < 6) {
    	response.sendRedirect("registrarCliente.jsp?msg=claveCorta");
        return;
    }
    
    Conexion cn = new Conexion();
    Connection con = cn.getConexion();
    String mensaje = "";

    try {
        if (con != null) {

            int idPerfil = 2;  // Perfil cliente

            int idEstado = 1;  
            try {
                idEstado = Integer.parseInt(estado);  // 🔥 TOMADO DEL FORMULARIO
            } catch (Exception ex) {
                idEstado = 1; // por defecto
            }

            String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
                       + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idPerfil);
            ps.setInt(2, idEstado);   // 🔥 AHORA SÍ GUARDA SOLTERO/CASADO
            ps.setString(3, nombre);
            ps.setString(4, cedula);
            ps.setString(5, correo);
            ps.setString(6, clave);

            int r = ps.executeUpdate();
            mensaje = (r > 0) ? "Registro exitoso" : "Error al registrar";

            ps.close();
            con.close();

        } else {
            mensaje = "Error de conexión.";
        }
    } catch (Exception e) {
        mensaje = "Error: " + e.getMessage();
    }
    System.out.println("FORM RECIBIDO");
    out.println("<script>alert('" + mensaje + "'); window.location='login.jsp';</script>");
%>
