<%@ page import="java.util.ArrayList" %>
<%@ page import="com.productos.negocio.Producto" %>
<%@ page import="com.productos.negocio.ItemCarrito" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Producto p = new Producto().obtenerPorId(id);

    ArrayList<ItemCarrito> carrito = 
        (ArrayList<ItemCarrito>) session.getAttribute("carrito");

    if (carrito == null) carrito = new ArrayList<>();

    boolean existe = false;

    for (ItemCarrito item : carrito) {
        if (item.getId() == id) {
            item.setCantidad(item.getCantidad() + 1);
            existe = true;
            break;
        }
    }

    if (!existe) {
        carrito.add(new ItemCarrito(
            p.getId_pr(),
            p.getNombre_pr(),
            p.getPrecio_pr(),
            1,
            p.getFoto_pr()
        ));
    }

    session.setAttribute("carrito", carrito);

    response.sendRedirect("carrito.jsp");
%>
