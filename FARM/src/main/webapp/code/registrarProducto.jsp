<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registrar Producto</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #fff5f5;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container {
            max-width: 550px;
            margin: auto;
            margin-top: 40px;
            background: white;
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .btn-guardar {
            background: #d32f2f;
            color: white;
        }
        .btn-guardar:hover {
            background: #b71c1c;
        }
    </style>
</head>

<body>

<%@ include file="menu.jsp" %>

<div class="form-container">

    <h3 class="text-center mb-4">Registrar Nuevo Producto</h3>

    <form method="post" action="registrarProductoProceso.jsp" enctype="multipart/form-data">

        <label>Categoría:</label>
        <select name="id_cat" class="form-select" required>
            <option value="1">Insumos Médicos</option>
            <option value="2">Medicinas</option>
            <option value="3">Otros</option>
        </select>
        <br>

        <label>Nombre:</label>
        <input type="text" name="nombre" class="form-control" required>
        <br>

        <label>Cantidad:</label>
        <input type="number" name="cantidad" min="1" class="form-control" required>
        <br>

        <label>Precio:</label>
        <input type="number" name="precio" step="0.01" class="form-control" required>
        <br>

        <label>Foto del producto:</label>
        <input type="file" name="foto" class="form-control">
        <br>

        <button class="btn btn-guardar w-100">Guardar Producto</button>

    </form>

</div>

</body>
</html>
