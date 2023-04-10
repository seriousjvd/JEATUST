<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 05/04/2023
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JEATUST</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search.css">
</head>
<body>
    <jsp:include page="AppHeader.jsp">
        <jsp:param name="noparam" value="" />
    </jsp:include>
    <div class="central-big border">
        <div class="info-search">
            <div class="direction border">
                <div class="direction-text">${direction}</div>
            </div>
            <input class="search-input" type="text" placeholder="busca un restaurante">
        </div>
        <div class="content">
            <div class="filter-column">
                <c:forEach var="category" items="${categoryList}">
                <a class="filter" href="<c:url value='/SearchServlet.do?category=${category.id}'/>">${category.name}</a>
                </c:forEach>
            </div>
            <div class="places-column">
                <c:forEach var="restaurant" items="${restaurantList}">
                    <a href="<c:url value="/RestaurantServlet.do?id=${restaurant.id}"/>">
                        <div class="place">
                            <div class="place-image">
                                <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                            </div>
                            <div class="place-info">
                                <div class="place-name">${restaurant.name}</div>
                                <div class="place-description">${restaurant.address}</div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
