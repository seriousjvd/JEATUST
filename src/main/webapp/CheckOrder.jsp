<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 08/04/2023
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/edition.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/restaurant.css">
    <title>JEATUST</title>
</head>
<body>

<jsp:include page="AppHeader.jsp">
    <jsp:param name="noparam" value="" />
</jsp:include>
<div class="central-big border">
    <div class="title">
        Pedido
    </div>
    <div class="menu-column">
        <div class="menu-item">
            <div class="menu-item-info">
                <div id="dish-name">Comida</div>
                <div id="dish-description">Comida hecha usando comida</div>
                <div id="dish-price">Comida€</div>
            </div>
            <div class="menu-item-buttons">
                <button type="submit">borrar</button>
            </div>
        </div>
    </div>
    <div class="button-list">
        <button type="submit">Pedir</button>
    </div>
</div>
</body>
</html>