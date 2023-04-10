<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:forEach var="dish" items="${orderDishes}">
            <div class="menu-item">
                <div class="menu-item-info">
                    <div id="dish-name">${dish.name}</div>
                    <div id="dish-description">${dish.description}</div>
                    <div id="dish-price">${dish.price}</div>
                </div>
                <div class="menu-item-buttons">
                    <button type="submit">borrar</button>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="button-list">
        <div>Precio total: ${totalPrice}</div>
        <button id="place-order" type="submit">Pedir</button>
    </div>
</div>

<script>
    const placeOrder = document.getElementById("place-order");
    addToCart.addEventListener("click", function() {
        const name = document.getElementById("name");
        $.ajax({
            url: "CheckOrderServlet",
            type: "POST",
            dishName: name
        })
    })
</script>

</body>
</html>