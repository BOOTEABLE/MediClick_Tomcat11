package com.productos.negocio;

public class ItemCarrito {
    private int id;
    private String nombre;
    private double precio;
    private int cantidad;
    private double subtotal;
    private String foto;

    public ItemCarrito(int id, String nombre, double precio, int cantidad, String foto) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
        this.foto = foto;
        this.subtotal = precio * cantidad;
    }

    public int getId() { return id; }
    public String getNombre() { return nombre; }
    public double getPrecio() { return precio; }
    public int getCantidad() { return cantidad; }
    public double getSubtotal() { return subtotal; }
    public String getFoto() { return foto; }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
        this.subtotal = cantidad * precio;
    }
}
