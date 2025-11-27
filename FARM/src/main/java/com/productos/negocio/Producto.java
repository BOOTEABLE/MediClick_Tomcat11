package com.productos.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.productos.datos.Conexion;

public class Producto {

    private int id_pr;
    private int id_cat;
    private String nombre_pr;
    private int cantidad_pr;
    private double precio_pr;
    private String foto_pr;

    // -------- GETTERS Y SETTERS --------
    public int getId_pr() { return id_pr; }
    public void setId_pr(int id_pr) { this.id_pr = id_pr; }

    public int getId_cat() { return id_cat; }
    public void setId_cat(int id_cat) { this.id_cat = id_cat; }

    public String getNombre_pr() { return nombre_pr; }
    public void setNombre_pr(String nombre_pr) { this.nombre_pr = nombre_pr; }

    public int getCantidad_pr() { return cantidad_pr; }
    public void setCantidad_pr(int cantidad_pr) { this.cantidad_pr = cantidad_pr; }

    public double getPrecio_pr() { return precio_pr; }
    public void setPrecio_pr(double precio_pr) { this.precio_pr = precio_pr; }

    public String getFoto_pr() { return foto_pr; }
    public void setFoto_pr(String foto_pr) { this.foto_pr = foto_pr; }

    // -------- INSERTAR --------
    public String insertar() {
        Conexion con = new Conexion();
        String sql = "INSERT INTO tb_producto (id_cat, nombre_pr, cantidad_pr, precio_pr, foto_pr) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id_cat);
            ps.setString(2, nombre_pr);
            ps.setInt(3, cantidad_pr);
            ps.setDouble(4, precio_pr);
            ps.setString(5, foto_pr);
            ps.executeUpdate();
            return "Producto registrado correctamente";
        } catch (Exception e) {
            return "Error al registrar: " + e.getMessage();
        }
    }

    // -------- LISTAR --------
    public ResultSet listar() {
        Conexion con = new Conexion();
        String sql = "SELECT * FROM tb_producto";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            return ps.executeQuery();
        } catch (Exception e) {
            return null;
        }
    }

    // -------- OBTENER POR ID --------
    public Producto obtenerPorId(int id) {
        Conexion con = new Conexion();
        Producto p = null;

        String sql = "SELECT * FROM tb_producto WHERE id_pr = ?";

        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Producto();
                p.setId_pr(rs.getInt("id_pr"));
                p.setId_cat(rs.getInt("id_cat"));
                p.setNombre_pr(rs.getString("nombre_pr"));
                p.setCantidad_pr(rs.getInt("cantidad_pr"));
                p.setPrecio_pr(rs.getDouble("precio_pr"));
                p.setFoto_pr(rs.getString("foto_pr"));
            }

        } catch (Exception e) {
            System.out.println("ERROR obtenerPorId: " + e.getMessage());
        }
        return p;
    }

    // -------- ACTUALIZAR --------
    public String actualizar() {
        Conexion con = new Conexion();
        String sql = "UPDATE tb_producto SET id_cat=?, nombre_pr=?, cantidad_pr=?, precio_pr=?, foto_pr=? WHERE id_pr=?";

        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);

            ps.setInt(1, id_cat);
            ps.setString(2, nombre_pr);
            ps.setInt(3, cantidad_pr);
            ps.setDouble(4, precio_pr);
            ps.setString(5, foto_pr);
            ps.setInt(6, id_pr);

            ps.executeUpdate();
            return "Producto actualizado correctamente";

        } catch (Exception e) {
            return "Error al actualizar: " + e.getMessage();
        }
    }

    // -------- ELIMINAR --------
    public String eliminar(int id) {
        Conexion con = new Conexion();
        String sql = "DELETE FROM tb_producto WHERE id_pr=?";

        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return "Producto eliminado correctamente";

        } catch (Exception e) {
            return "Error al eliminar: " + e.getMessage();
        }
    }
}
