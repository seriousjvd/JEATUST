<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 05/04/2023
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JEATUST</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search.css">
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
        <div class="info-search">
            <div class="direction border">
                <div class="direction-text">DIRECTION</div>
            </div>
            <input class="search-input" type="text" placeholder="busca un restaurante">
        </div>
        <div class="content">
            <div class="filter-column">
                <div class="filter">TYPE-1</div>
                <div class="filter">TYPE-2</div>
                <div class="filter">TYPE-3</div>
                <div class="filter">TYPE-4</div>
                <div class="filter">TYPE-5</div>
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
                </div>
                <div class="place">
                    <div class="place-image">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
                    </div>
                    <div class="place-info">
                        <div class="place-name">PLACE NAME</div>
                        <div class="place-description">PLACE DESC</div>
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
                </div>
            </div>
        </div>
    </div>
</body>
</html>
