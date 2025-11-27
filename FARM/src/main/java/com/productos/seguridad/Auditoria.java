package com.productos.seguridad;

import com.productos.datos.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Auditoria {

    public String consultarAuditoria(String fechaDesde, String fechaHasta,
                                     String tabla, String usuario, String operacion) {

        Conexion con = new Conexion();
        StringBuilder html = new StringBuilder();

        try {

            // ====== Construcción dinámica del SQL ======
            String sql = """
                SELECT id_aud, tabla_aud, operacion_aud,
                       valoranterior_aud, valornuevo_aud,
                       fecha_aud, usuario_aud
                FROM auditoria.tb_auditoria
                WHERE 1 = 1
                """;

            List<String> condiciones = new ArrayList<>();

            if (fechaDesde != null && !fechaDesde.isEmpty()) {
                condiciones.add("fecha_aud >= '" + fechaDesde + "'");
            }
            if (fechaHasta != null && !fechaHasta.isEmpty()) {
                condiciones.add("fecha_aud <= '" + fechaHasta + "'");
            }
            if (tabla != null && !tabla.isEmpty()) {
                condiciones.add("tabla_aud ILIKE '%" + tabla + "%'");
            }
            if (usuario != null && !usuario.isEmpty()) {
                condiciones.add("usuario_aud ILIKE '%" + usuario + "%'");
            }
            if (operacion != null && !operacion.isEmpty()) {
                condiciones.add("operacion_aud = '" + operacion + "'");
            }

            // Unimos condiciones
            for (String c : condiciones) {
                sql += " AND " + c + " ";
            }

            sql += " ORDER BY fecha_aud DESC";

            ResultSet rs = con.Consulta(sql);

            // === Armamos tabla ===
            html.append("""
                <table class='table table-striped table-hover'>
                    <thead class='table-dark'>
                        <tr>
                            <th>ID</th>
                            <th>Fecha</th>
                            <th>Tabla</th>
                            <th>Operación</th>
                            <th>Usuario</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                """);

            while (rs.next()) {

                int id = rs.getInt("id_aud");
                String tablaAud = rs.getString("tabla_aud");
                String oper = rs.getString("operacion_aud");
                if (oper == null) oper = "";

                String fecha = String.valueOf(rs.getTimestamp("fecha_aud"));
                String usu = rs.getString("usuario_aud");

                String valOld = rs.getString("valoranterior_aud");
                String valNew = rs.getString("valornuevo_aud");

                String badgeColor = switch (oper) {
                case "I" -> "success";
                case "U" -> "warning";
                case "D" -> "danger";
                default -> "secondary";
            };

                // === FILA DE LA TABLA ===
                html.append("<tr>");
                html.append("<td>").append(id).append("</td>");
                html.append("<td>").append(fecha).append("</td>");
                html.append("<td>").append(tablaAud).append("</td>");
                html.append("<td><span class='badge bg-")
                    .append(badgeColor)
                    .append("'>")
                    .append(oper)
                    .append("</span></td>");
                html.append("<td>").append(usu).append("</td>");

                // Botón que abre el modal
                html.append(
                    "<td>" +
                    "<button class='btn btn-primary btn-sm' " +
                    "data-bs-toggle='modal' " +
                    "data-bs-target='#modal" + id + "'>" +
                    "Ver detalle" +
                    "</button>" +
                    "</td>"
                );
                html.append("</tr>");

                // === MODAL DE BOOTSTRAP ===
                html.append(
                        "<div class='modal fade' id='modal" + id + "' tabindex='-1'>" +
                        "<div class='modal-dialog modal-lg modal-dialog-scrollable'>" +
                        "<div class='modal-content'>" +

                        "<div class='modal-header'>" +
                        "<h5 class='modal-title'>Detalle del Registro " + id + "</h5>" +
                        "<button type='button' class='btn-close' data-bs-dismiss='modal'></button>" +
                        "</div>" +

                        "<div class='modal-body'>" +

                        "<h6>Valor anterior</h6>" +
                        "<pre class='bg-light border p-3 rounded'>" +
                        (valOld == null ? "NULL" : valOld) +
                        "</pre>" +

                        "<h6>Valor nuevo</h6>" +
                        "<pre class='bg-light border p-3 rounded'>" +
                        (valNew == null ? "NULL" : valNew) +
                        "</pre>" +

                        "</div>" + // modal-body

                        "</div>" + // modal-content
                        "</div>" + // modal-dialog
                        "</div>"   // modal
                );
            }

            html.append("</tbody></table>");

        } catch (Exception e) {
            html.append("<div class='alert alert-danger'>Error: ")
                .append(e.getMessage())
                .append("</div>");
        }

        return html.toString();
    }
}

