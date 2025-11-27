package com.productos.seguridad;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.Conexion;

/**
 * Clase que representa una Pagina y construye el menú dinámicamente
 * basado en el perfil del usuario, con estilos Bootstrap.
 */
public class Pagina {

    private int id;
    private String nombre;
    private String path;

    public Pagina() { }

    public Pagina(int id, String nombre, String path) {
        this.id = id;
        this.nombre = nombre;
        this.path = path;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }

    /**
     * Construye el menú considerando las páginas que tiene acceso según el perfil del usuario.
     * Perfil 1 = Administrador
     * Perfil 2 = Cliente
     * Perfil 3 = Vendedor
     */
    public String mostrarMenu(Integer nperfil) {
        StringBuilder menu = new StringBuilder();
        String titulo = "";
        String navClass = "nav flex-row nav-pills bg-warning p-3 rounded";

        switch (nperfil) {
            case 1:
                titulo = "Menú del Administrador";
                break;
            case 2:
                titulo = "Menú del Cliente";
                break;
            case 3:
                titulo = "Menú del Vendedor";
                break;
            default:
                titulo = "Menú General";
                break;
        }

        menu.append("<h3 class='mb-3'>").append(titulo).append("</h3>");
        menu.append("<ul class='").append(navClass).append("'>");

        String sql = "SELECT pag.descripcion_pag, pag.path_pag " +
                     "FROM tb_pagina pag " +
                     "INNER JOIN tb_perfilpagina pper ON pag.id_pag = pper.id_pag " +
                     "WHERE pper.id_per = " + nperfil +
                     " ORDER BY pag.id_pag;";

        Conexion con = new Conexion();
        ResultSet rs = null;

        try {
            rs = con.Consulta(sql);
            boolean tienePaginas = false;

            while (rs.next()) {
                tienePaginas = true;
                String nombrePagina = rs.getString("descripcion_pag");
                String pathPagina = rs.getString("path_pag");

                menu.append("<li class='nav-item mb-2'>")
                    .append("<a class='nav-link btn btn-outline-dark w-100' href='")
                    .append(pathPagina)
                    .append("'>")
                    .append(nombrePagina)
                    .append("</a></li>");
            }

            if (!tienePaginas) {
                menu.append("<li><i>No hay páginas asignadas a este perfil.</i></li>");
            }

            menu.append("</ul>");
            if (rs != null) {
				rs.close();
			}
        } catch (SQLException e) {
            menu.append("<p class='text-danger'>Error al generar menú: ")
                .append(e.getMessage()).append("</p>");
        }

        return menu.toString();
    }
}
