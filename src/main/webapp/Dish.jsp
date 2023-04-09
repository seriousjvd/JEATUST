<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 09/04/2023
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/restaurant.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/edition.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dish.css">
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
        Plato
    </div>
    <div class="dish">
        <div class="edition-column-container border">
            <div class="edition-box">
                <div>Nombre</div>
                <input type="text" id="name" name="name" />
            </div>
            <div class="edition-box">
                <div>Descripcion</div>
                <div><textarea id="description" placeholder="Descripcion..."></textarea></div>
            </div>
            <div class="edition-box">
                <div>Precio</div>
                <input type="text" id="price" name="phone" />
            </div>
        </div>
    </div>
    <button type="submit" class="save">Guardar</button>
</div>
