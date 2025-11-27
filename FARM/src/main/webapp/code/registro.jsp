<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Cliente - MediClick</title>
    <script src="cliente.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #ffebee, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        form {
            background-color: #ffffff;
            color: #333;
            padding: 40px;
            border-radius: 20px;
            width: 480px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #c62828;
            margin-bottom: 25px;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            text-align: left;
            font-weight: 500;
        }

        input, select {
            width: 100%;
            padding: 8px;
            border-radius: 8px;
            border: 1.5px solid #ccc;
            transition: all 0.3s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #c62828;
            box-shadow: 0 0 8px rgba(198, 40, 40, 0.4);
        }

        input[type="radio"] {
            width: auto;
            margin-right: 5px;
        }

        input[type="file"] {
            border: none;
        }

        input[type="color"] {
            width: 60px;
            height: 35px;
            border: none;
            background: none;
        }

        input[type="submit"], input[type="reset"] {
            width: 45%;
            background-color: #c62828;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
            margin: 10px 5px;
        }

        input[type="submit"]:hover {
            background-color: #a31212;
        }

        input[type="reset"] {
            background-color: #2c2c2c;
        }

        input[type="reset"]:hover {
            background-color: #000;
        }

        /* Línea decorativa superior */
        form::before {
            content: "";
            display: block;
            width: 60%;
            height: 5px;
            background: linear-gradient(90deg, #2c2c2c, #c62828, #2c2c2c);
            margin: 0 auto 20px auto;
            border-radius: 10px;
        }

        /* Responsive */
        @media (max-width: 600px) {
            form {
                width: 90%;
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <form id="formCliente" action="registrarCliente.jsp" method="post">

    <h2>Registro de Nuevo Cliente</h2>

    <table>
        <tr>
            <td>Nombre</td>
            <td><input type="text" id="nombre" name="txtNombre" required /></td>
        </tr>

        <tr>
            <td>Cédula</td>
            <td><input type="text" id="cedula" name="txtCedula" maxlength="10" required /></td>
        </tr>

        <tr>
            <td>Estado Civil</td>
            <td>
                <select id="estado" name="cmbEstado" required>
                    <option value="Soltero">Soltero</option>
                    <option value="Casado">Casado</option>
                    <option value="Divorciado">Divorciado</option>
                    <option value="Viudo">Viudo</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>Lugar de Residencia</td>
            <td>
                <input type="radio" name="rdResidencia" value="Sur" required> Sur
                <input type="radio" name="rdResidencia" value="Norte"> Norte
                <input type="radio" name="rdResidencia" value="Centro"> Centro
            </td>
        </tr>

        <tr>
            <td>Mes y Año de Nacimiento</td>
            <td><input type="month" id="fecha" name="mFecha" required /></td>
        </tr>

        <tr>
            <td>Color Favorito</td>
            <td><input type="color" id="color" name="cColor" /></td>
        </tr>

        <tr>
            <td>Correo Electrónico</td>
            <td><input type="email" id="correo" name="txtCorreo"
		       placeholder="usuario@nombreProveedor.dominio"
		       required
		       pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
		       title="Ingrese un correo válido. Ejemplo: usuario@gmail.com" /></td>
        </tr>

        <tr>
            <td>Clave</td>
            <td><input type="password" id="clave" name="txtClave"
		       minlength="6"
		       required
		       title="La clave debe tener al menos 6 caracteres" /></td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="submit" value="Registrar">
                <input type="reset" value="Limpiar">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
