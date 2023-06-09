<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JEATUST</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <div class="app-header">
        <%--imagen de jeatust--%>
        <div class="home-button">
            <a href="${pageContext.request.contextPath}/home.jsp">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
            </a>
        </div>
        <div class="login-button">
            <a href="${pageContext.request.contextPath}/login.jsp">
                <img src="${pageContext.request.contextPath}/images/login_icon.png" alt="">
            </a>
        </div>
    </div>
    <div class="central-big border">
        <p class="title">Introduce tu dirección para ver restaurantes cerca de ti</p>
        <input class="search-input" type="text" placeholder="ej. Calle Londres, 10, Cáceres">
        <p class="types-text">Tipos de cocina más populares</p>
        <div class="types-grid">
            <div class="types-grid-item">a</div>
            <div class="types-grid-item">a</div>
            <div class="types-grid-item">a</div>
            <div class="types-grid-item">a</div>
            <div class="types-grid-item">a</div>
            <div class="types-grid-item">a</div>
            <div class="types-grid-item">a</div>
        </div>
    </div>
</body>
</html>
