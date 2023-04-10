<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="AppHeader.jsp">
        <jsp:param name="noparam" value="" />
    </jsp:include>
    <div class="central-big border">
        <div class="title">
            ${restaurant.name}
        </div>
        <div class="place">
            <div class="place-image">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
            </div>
            <div class="place-description">${restaurant.address}</div>
            <button class="opinion" type="submit">${restaurant.gradesAverage}</button>
        </div>
        <div class="menu-text">Menu:</div>
        <div class="menu-column">
            <c:forEach var="dish" items="${dishList}">
                <div class="menu-item">
                    <div class="menu-item-image">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                    </div>
                    <div class="menu-item-info">
                        <div id="name">${dish.name}</div>
                        <div id="description">${dish.description}</div>
                        <div id="price">${dish.price}</div>
                    </div>
                    <div class="menu-item-buttons">
                        <button id="add-to-cart" type="submit" value="${dish.id}">Añadir al carrito</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script>
        document.addEventListener("click", function(event) {
            if (event.target.id === "add-to-cart") {
                fetch("${pageContext.request.contextPath}/AddToCartServlet.do", {
                    method: "POST",
                    body: "dishId="+event.target.value
                })
            }
        })
    </script>
</body>
</html>