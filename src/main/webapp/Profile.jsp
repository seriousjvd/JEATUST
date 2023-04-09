<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 08/04/2023
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/edition.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css">
    <title>JEATUST</title>
</head>
<body>
<div class="app-header">
    <div class="home-button">
        <a href="${pageContext.request.contextPath}/Home.jsp">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
        </a>
    </div>
    <div class="right-buttons">
        <a href="${pageContext.request.contextPath}/Login.jsp">
            <img src="${pageContext.request.contextPath}/images/shopping_cart.png" alt="">
        </a>
        <a href="${pageContext.request.contextPath}/Login.jsp">
            <img src="${pageContext.request.contextPath}/images/login_icon.png" alt="">
        </a>
    </div>
</div>
<div class="central-big border">
    <div class="title">
        Perfil
    </div>
    <div class="edition-column-container border">
        <div class="edition-box">
            <div>Nombre</div>
            <input type="text" id="firstName" name="firstName" />
        </div>
        <div class="edition-box">
            <div>Apellidos</div>
            <input type="text" id="lastName" name="lastName" />
        </div>
        <div class="edition-box">
            <div>E-mail</div>
            <input type="text" id="email" name="email" />
        </div>
        <div class="edition-box">
            <div>Contraseña</div>
            <input type="text" id="password" name="password" />
        </div>
    </div>
    <div class="button-list">
        <button type="submit">Guardar</button>
        <button type="submit">Mis restaurantes</button>
        <button type="submit">Borrar cuenta</button>
    </div>
    <div class="historic-text">
        Historial de pedidos
    </div>
    <div class="order">
        <div class="order-info">Order description</div>
        <div class="order-buttons">
            <div class="order-price">Precio €</div>
            <button type="submit">volver a pedir</button>
        </div>
    </div>
</div>
</body>
</html>
