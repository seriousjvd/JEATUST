<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 06/04/2023
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/restaurant.css">
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
            Horizon Lunar Colony
        </div>
        <div class="place">
            <div class="place-image">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
            </div>
            <div class="place-description">PLACE DESC</div>
            <button class="opinion" type="submit">opiniones</button>
        </div>
        <div class="menu-text">Menu:</div>
        <div class="menu-column">
            <div class="menu-item">
                <div class="menu-item-image">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                </div>
                <div class="menu-item-info">
                    <div id="name">Comida</div>
                    <div id="description">Comida hecha usando comida</div>
                    <div id="price">Comida€</div>
                </div>
                <div class="menu-item-buttons">
                    <button type="submit">añadir al carrito</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>