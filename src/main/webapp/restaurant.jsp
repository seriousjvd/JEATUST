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
        <div class="title">
            Horizon Lunar Colony
        </div>
        <div class="place">
            <div class="place-image">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
            </div>
            <div class="place-description">PLACE DESC</div>
        </div>
        <div class="menu-text">Menu:</div>
        <div class="menu-column">
            <div class="menu-item">
                <div class="menu-item-image">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                </div>
                <div class="menu-item-info">
                    <div>Comida</div>
                    <div>Comida hecha usando comida</div>
                    <div>Comida€</div>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu-item-image">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                </div>
                <div class="menu-item-info">
                    <div>Comida</div>
                    <div>Comida hecha usando comida</div>
                    <div>Comida€</div>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu-item-image">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                </div>
                <div class="menu-item-info">
                    <div>Comida</div>
                    <div>Comida hecha usando comida</div>
                    <div>Comida€</div>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu-item-image">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                </div>
                <div class="menu-item-info">
                    <div>Comida</div>
                    <div>Comida hecha usando comida</div>
                    <div>Comida€</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>