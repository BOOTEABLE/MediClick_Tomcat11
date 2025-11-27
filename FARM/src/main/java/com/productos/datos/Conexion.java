package com.productos.datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Conexion {

    private Connection con;
    private Statement st;

    private String driver = "org.postgresql.Driver";
    private String url = "jdbc:postgresql://172.17.42.121:5432/bd_mediclick";
    private String user = "alumno";
    private String password = "alumno";

    // ==============================
    //   Constructor: crea conexión
    // ==============================
    public Conexion() {
        this.con = crearConexion();
    }

    // ======================================
    //   Crear conexión (similar a segunda)
    // ======================================
    private Connection crearConexion() {
        try {
            Class.forName(driver);
            Connection cn = DriverManager.getConnection(url, user, password);
            System.out.println("Conexión exitosa a BD.");
            return cn;

        } catch (Exception e) {
            System.out.println("Error al conectar: " + e.getMessage());
            return null;
        }
    }

    // ==============================
    //   Obtener conexión
    // ==============================
    public Connection getConexion() {
        return con;
    }

    // ==========================================
    //   Ejecutar SQL (INSERT, UPDATE, DELETE)
    // ==========================================
    public String Ejecutar(String sql) {
        String resultado = "";

        try {
            st = con.createStatement();
            st.execute(sql);
            resultado = "Operación realizada con éxito";

        } catch (Exception e) {
            resultado = "Error: " + e.getMessage();
        }

        return resultado;
    }

    // ==========================================
    //   Consultas SQL (SELECT)
    // ==========================================
    public ResultSet Consulta(String sql) {
        try {
            st = con.createStatement();
            return st.executeQuery(sql);

        } catch (Exception e) {
            System.out.println("Error en consulta: " + e.getMessage());
            return null;
        }
    }

    // ==============================
    //   Cerrar conexión
    // ==============================
    public void cerrar() {
        try {
            if (con != null) {
				con.close();
			}
            System.out.println("Conexión cerrada.");
        } catch (Exception e) {
            System.out.println("Error al cerrar: " + e.getMessage());
        }
    }
}
