<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 08/04/2023
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:choose>
            <c:when test="${!restaurantsCheck}">
                <div class="text">
                    AUN NO HAS CREADO RESTAURANTES
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="restaurant" items="${restaurantList}">
                    <div class="place">
                        <div class="place-image">
                            <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                        </div>
                        <div class="place-info">
                            <div class="place-name">${restaurant.name}</div>
                            <div class="place-description">${restaurant.name}</div>
                        </div>
                        <div class="place-buttons">
                            <a href="${pageContext.request.contextPath}/EditionServlet.do?restaurant=${restaurant.id}"><button type="submit">editar</button></a>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <a href="${pageContext.request.contextPath}/EditionServlet.do"><button type="submit">añadir resturante</button></a>
</div>
</body>
</html>