<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 08/04/2023
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/restaurant_manager.css">
    <title>JEATUST</title>
</head>
<body>
<jsp:include page="AppHeader.jsp">
    <jsp:param name="noparam" value="" />
</jsp:include>
<div class="central-big border">
    <div class="title">
        Mis restaurantes
    </div>
    <div class="places-column">
        <div class="place">
            <div class="place-image">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
            </div>
            <div class="place-info">
                <div class="place-name">PLACE NAME</div>
                <div class="place-description">PLACE DESC</div>
            </div>
            <div class="place-buttons">
                <button type="submit">editar</button>
            </div>
        </div>
        <div class="place">
            <div class="place-image">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
            </div>
            <div class="place-info">
                <div class="place-name">PLACE NAME</div>
                <div class="place-description">PLACE DESC</div>
            </div>
            <div class="place-buttons">
                <button type="submit">editar</button>
            </div>
        </div>
    </div>
    <button type="submit">añadir resturante</button>
</div>
</body>
</html>