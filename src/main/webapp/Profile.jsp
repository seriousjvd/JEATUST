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
<jsp:include page="AppHeader.jsp">
    <jsp:param name="noparam" value="" />
</jsp:include>
<div class="central-big border">
    <div class="title">
        Perfil
    </div>
    <form method="post" action="ProfileServlet.do">
        <div class="edition-column-container border">
            <div class="edition-box">
                <div>Nombre</div>
                <input type="text" id="firstName" name="firstName" value=${userFirstName}>
            </div>
            <div class="edition-box">
                <div>Apellido</div>
                <input type="text" id="lastName" name="lastName" value=${userLastName}>
            </div>
            <div class="edition-box">
                <div>E-mail</div>
                <input type="email" id="email" name="email" value=${userEmail}>
            </div>
            <div class="edition-box">
                <div>Contraseña</div>
                <input type="password" id="password" name="password" value=${userPassword}>
            </div>
        </div>
        <div class="button-list">
            <button type="submit" name="action" value="save">Guardar</button>
            <a href="${pageContext.request.contextPath}/RestaurantManagerServlet.do"><button type="button">Mis restaurantes</button></a>
            <button type="submit" name="action" value="delete">Borrar cuenta</button>
        </div>
    </form>
    <div class="text">
        Historial de pedidos
    </div>
<c:choose>
    <c:when test="${!ordersCheck}">
    <div class="text">
        AUN NO SE HA REALIZADO NINGUN PEDIDO
    </div>
    </c:when>
    <c:otherwise>
        <c:forEach var="order" items="${orderList}">
        <div class="order">
            <div class="order-info">Pedido ${order.id}</div>
            <div class="order-buttons">
                <div class="order-price">Precio: ${order.totalPrice} €</div>
                <a href="${pageContext.request.contextPath}/OrderServlet.do"><button type="button">revisar</button></a>
            </div>
        </div>
        </c:forEach>
    </c:otherwise>
</c:choose>
</div>
</body>
</html>