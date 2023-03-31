<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Crear cuenta</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="central-small border">
        <div class="title">
            Crear cuenta
        </div>
        <form method="post" action="RegisterServlet.do">
            <input type="text" name="firstName" placeholder="Nombre" required autocomplete="on"/>
            <input type="text" name="lastName" placeholder="Apellido" required autocomplete="on"/>
            <input type="email" name="mail" placeholder="Correo electronico" required autocomplete="on"/>
            <input type="password" name="password" placeholder="Contraseña" required autocomplete="off"/>
            <button type="submit">Crear cuenta</button>
            <p>Al crear una cuenta, aceptas nuestros <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley">Términos y Condiciones</a></p>
            <p>Aquí nuestra <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley">Política de Privacidad</a> y <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley">Política de Cookie</a></p>
        </form>
        <div class="help">
            <p>¿Ya tienes cuenta? <a href="${pageContext.request.contextPath}/login.jsp">inicia sesión</a></p>
        </div>
    </div>
</body>
</html>