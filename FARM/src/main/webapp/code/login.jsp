<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login - MediClick</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #ffebee, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            width: 340px;
            text-align: center;
        }

        h2 {
            color: #c62828;
            font-weight: bold;
            margin-bottom: 25px;
        }

        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1.5px solid #ccc;
            transition: all 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #c62828;
            box-shadow: 0 0 8px rgba(198, 40, 40, 0.4);
        }

        button {
            background-color: #c62828;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #a31212;
        }

        a {
            color: #c62828;
            text-decoration: none;
            font-size: 0.9em;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #a31212;
            text-decoration: underline;
        }

        .footer-text {
            margin-top: 15px;
            color: #444;
            font-size: 0.9em;
        }

        /* Borde superior decorativo */
        .login-container::before {
            content: "";
            display: block;
            width: 60%;
            height: 5px;
            background: linear-gradient(90deg, #2c2c2c, #c62828, #2c2c2c);
            margin: 0 auto 20px auto;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <form action="validarLogin.jsp" method="post">
            <input type="text" name="usuario" placeholder="Correo electrónico" required>
            <input type="password" name="clave" placeholder="Contraseña" required>
            <button type="submit">Entrar</button>
        </form>
        <p class="footer-text">¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
    </div>
</body>
</html>
