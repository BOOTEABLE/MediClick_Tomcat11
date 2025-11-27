package com.productos.seguridad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.productos.datos.Conexion;

public class Usuario {

    int id;
    int perfil;
    int estado;
    String cedula;
    String nombre;
    String correo;
    String clave;

    public Usuario() { }

    public Usuario(int id, int perfil, int estado, String cedula, String nombre, String correo, String clave) {
        this.id = id;
        this.perfil = perfil;
        this.estado = estado;
        this.cedula = cedula;
        this.nombre = nombre;
        this.correo = correo;
        this.clave = clave;
    }

    // GETTERS / SETTERS
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPerfil() { return perfil; }
    public void setPerfil(int perfil) { this.perfil = perfil; }

    public int getEstado() { return estado; }
    public void setEstado(int estado) { this.estado = estado; }

    public String getCedula() { return cedula; }
    public void setCedula(String cedula) { this.cedula = cedula; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }

    // ======================================================
    // VALIDACIÓN DE LOGIN
    // ======================================================
    public boolean verificarUsuario(String ncorreo, String nclave) {
        boolean respuesta = false;

        String sql = "SELECT * FROM tb_usuario WHERE correo_us='" + ncorreo +
                     "' AND clave_us='" + nclave + "'";

        try {
            Conexion con = new Conexion();
            ResultSet rs = con.Consulta(sql);

            if (rs.next()) {
                respuesta = true;
                this.correo = ncorreo;
                this.clave = nclave;
                this.perfil = rs.getInt("id_per");
                this.nombre = rs.getString("nombre_us");
            }

            if (rs != null) rs.close();
            con.getConexion().close();

        } catch (Exception ex) {
            System.out.println("Error al verificar usuario: " + ex.getMessage());
        }

        return respuesta;
    }

    // ======================================================
    // LISTAR USUARIOS
    // ======================================================
    public String consultarUsuarios() {
        StringBuilder tabla = new StringBuilder();

        tabla.append("<table class='table table-striped table-bordered'>")
             .append("<thead>")
             .append("<tr>")
             .append("<th>#</th>")
             .append("<th>Nombre</th>")
             .append("<th>Correo</th>")
             .append("<th>Acciones</th>")
             .append("</tr>")
             .append("</thead><tbody>");

        try {
            Conexion con = new Conexion();
            ResultSet rs = con.Consulta("SELECT * FROM tb_usuario ORDER BY id_us");

            int i = 1;

            while (rs.next()) {
                int id = rs.getInt("id_us");
                String nombre = rs.getString("nombre_us");
                String correo = rs.getString("correo_us");

                tabla.append("<tr>")
                     .append("<td>").append(i++).append("</td>")
                     .append("<td>").append(nombre).append("</td>")
                     .append("<td>").append(correo).append("</td>")
                     .append("<td>")
                     .append("<a href='modificar.jsp?id=").append(id)
                     .append("' class='btn btn-warning btn-sm'>Editar</a> ")
                     .append("<a href='eliminarUsuario.jsp?id=").append(id)
                     .append("' class='btn btn-danger btn-sm' onclick='return confirm(\"¿Desea eliminar este usuario?\");'>Eliminar</a>")
                     .append("</td></tr>");
            }

            tabla.append("</tbody></table>");

            rs.close();
            con.getConexion().close();

        } catch (Exception e) {
            tabla = new StringBuilder("<p>Error al consultar usuarios.</p>");
        }

        return tabla.toString();
    }

    // ======================================================
    // OBTENER USUARIO POR ID (para editar)
    // ======================================================
    public Usuario obtenerPorId(int id) {
        Usuario u = null;

        try {
            Conexion con = new Conexion();
            ResultSet rs = con.Consulta("SELECT * FROM tb_usuario WHERE id_us=" + id);

            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id_us"));
                u.setPerfil(rs.getInt("id_per"));
                u.setEstado(rs.getInt("id_est"));
                u.setCedula(rs.getString("cedula_us"));
                u.setNombre(rs.getString("nombre_us"));
                u.setCorreo(rs.getString("correo_us"));
                u.setClave(rs.getString("clave_us"));
            }

            rs.close();
            con.getConexion().close();

        } catch (Exception ex) {
            System.out.println("Error obtenerPorId: " + ex.getMessage());
        }

        return u;
    }

    // ======================================================
    // ACTUALIZAR USUARIO
    // ======================================================
    public String actualizarUsuario() {
        String msg = "";

        try {
            Conexion con = new Conexion();
            Connection cn = con.getConexion();

            String sql = "UPDATE tb_usuario SET id_per=?, id_est=?, nombre_us=?, cedula_us=?, correo_us=?, clave_us=? WHERE id_us=?";
            PreparedStatement ps = cn.prepareStatement(sql);

            ps.setInt(1, this.perfil);
            ps.setInt(2, this.estado);
            ps.setString(3, this.nombre);
            ps.setString(4, this.cedula);
            ps.setString(5, this.correo);
            ps.setString(6, this.clave);
            ps.setInt(7, this.id);

            msg = ps.executeUpdate() > 0 ? "Usuario actualizado" : "Error al actualizar";

            ps.close();
            cn.close();

        } catch (Exception e) {
            msg = "Error: " + e.getMessage();
        }

        return msg;
    }

    // ======================================================
    // ELIMINAR USUARIO
    // ======================================================
    public String eliminarUsuario(int id) {
        String sql = "DELETE FROM tb_usuario WHERE id_us=" + id;

        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }

    // ======================================================
    // ACTUALIZAR ÚLTIMO LOGIN
    // ======================================================
    public boolean actualizarUltimoLogin(String correo) {
        boolean ok = false;

        try {
            Conexion con = new Conexion();
            Connection cn = con.getConexion();

            PreparedStatement ps = cn.prepareStatement(
                "UPDATE tb_usuario SET ultimo_login=CURRENT_TIMESTAMP WHERE correo_us=?"
            );

            ps.setString(1, correo);
            ok = ps.executeUpdate() > 0;

            ps.close();
            cn.close();

        } catch (Exception ex) {
            System.out.println("Error en ultimo_login: " + ex.getMessage());
        }

        return ok;
    }

    // ======================================================
    // LISTA AVANZADA CON ÚLTIMO INGRESO
    // ======================================================
    public String consultarUsuariosConUltimoIngreso() {

        StringBuilder tabla = new StringBuilder();

        tabla.append("<table class='table table-striped table-bordered'>")
             .append("<thead class='table-dark'>")
             .append("<tr><th>#</th><th>Nombre</th><th>Correo</th><th>Perfil</th><th>Último ingreso</th></tr>")
             .append("</thead><tbody>");

        try {
            Conexion con = new Conexion();
            ResultSet rs = con.Consulta("SELECT * FROM tb_usuario ORDER BY nombre_us ASC");

            int i = 1;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

            while (rs.next()) {

                int per = rs.getInt("id_per");
                String perfilTxt =
                    per == 1 ? "Administrador" :
                    per == 2 ? "Cliente" :
                    per == 3 ? "Vendedor" : "Otro";

                String ultimo = (rs.getTimestamp("ultimo_login") == null)
                                ? "—"
                                : sdf.format(rs.getTimestamp("ultimo_login"));

                tabla.append("<tr>")
                     .append("<td>").append(i++).append("</td>")
                     .append("<td>").append(rs.getString("nombre_us")).append("</td>")
                     .append("<td>").append(rs.getString("correo_us")).append("</td>")
                     .append("<td>").append(perfilTxt).append("</td>")
                     .append("<td>").append(ultimo).append("</td>")
                     .append("</tr>");
            }

            tabla.append("</tbody></table>");

            rs.close();
            con.getConexion().close();

        } catch (Exception ex) {
            tabla = new StringBuilder("<p>Error al consultar usuarios.</p>");
        }

        return tabla.toString();
    }
}
