<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JEATUST</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="central-small border">
        <div class="title">
            Bienvenido
        </div>
        <form method="post" action="LoginServlet.do">
            <input type="text" name="usuario" placeholder="Usuario" required autocomplete="on">
            <input type="password" name="password" placeholder="Contraseña" required autocomplete="off">
            <button type="submit">Login</button>
        </form>
        <div class="help">
            <a href="${pageContext.request.contextPath}/register.jsp">¿No tienes Cuenta? Registrate</a>
        </div>
    </div>
</body>
</html>