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

<jsp:include page="AppHeader.jsp">
    <jsp:param name="noparam" value="" />
</jsp:include>
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
