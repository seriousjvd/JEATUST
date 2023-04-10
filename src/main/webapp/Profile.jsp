<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 08/04/2023
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/edition.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css">
    <title>JEATUST</title>
</head>
<body>
<jsp:include page="AppHeader.jsp">
    <jsp:param name="noparam" value="" />
</jsp:include>
<div class="central-big border">
    <div class="title">
        Perfil
    </div>
    <div class="edition-column-container border">
        <div class="edition-box">
            <div>Nombre</div>

            <form method="post" action="ProfileServlet.do"><input type="text" id="firstName" name="firstName" value=${userFirstName}></form>
        </div>
        <div class="edition-box">
            <div>Apellidos</div>
            <form method="post" action="ProfileServlet.do"><input type="text" id="lastName" name="lastName" value=${userLastName}></form>
        </div>
        <div class="edition-box">
            <div>E-mail</div>
            <form method="post" action="ProfileServlet.do"><input type="email" id="email" name="email" value=${userEmail}></form>
        </div>
        <div class="edition-box">
            <div>Contraseña</div>
            <form method="post" action="ProfileServlet.do"><input type="password" id="password" name="password" value=${userPassword}></form>
        </div>
    </div>
    <div class="button-list">
        <form method="post"><button type="submit" name="action" value="save">Guardar</button></form>
        <a href="${pageContext.request.contextPath}/MyRestaurantsServlet.do"><button type="submit">Mis restaurantes</button></a>
        <form method="post"><button type="delete" name="action" value="delete">Borrar cuenta</button></form>
    </div>
    <div class="historic-text">
        Historial de pedidos
    </div>
<c:choose>
    <c:when test="${!ordersCheck}">
    <div class="historic-text">
        AUN NO SE HA REALIZADO NINGUN PEDIDO
    </div>
    </c:when>
    <c:otherwise>
        <c:forEach var="order" items="${orderList}">
        <div class="order">
            <div class="order-info">Pedido ${order.id}</div>
            <div class="order-buttons">
                <div class="order-price">Precio: ${order.totalPrice} €</div>
                <button type="submit">revisar</button>
            </div>
        </div>
        </c:forEach>
    </c:otherwise>
</c:choose>
</div>
</body>
</html>