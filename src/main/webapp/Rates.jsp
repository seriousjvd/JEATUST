<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 09/04/2023
  Time: 0:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/restaurant.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rate.css">
    <title>JEATUST</title>
</head>
<body>
<div class="app-header">
    <div class="home-button">
        <a href="${pageContext.request.contextPath}/Home.jsp">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
        </a>
    </div>
    <div class="right-buttons">
        <a href="${pageContext.request.contextPath}/Login.jsp">
            <img src="${pageContext.request.contextPath}/images/shopping_cart.png" alt="">
        </a>
        <a href="${pageContext.request.contextPath}/Login.jsp">
            <img src="${pageContext.request.contextPath}/images/login_icon.png" alt="">
        </a>
    </div>
</div>
<div class="central-big border">
    <div class="title">
        Horizon Lunar Colony
    </div>
    <div class="rate-box border">
        <textarea id="comment" placeholder="Escriba aqui su comentario"></textarea>
        <div class="rating">
            <input type="radio" id="star1" name="stars" value="stars"
                   >
            <label for="star1">1</label>
            <input type="radio" id="star2" name="stars" value="stars"
                   >
            <label for="star2">2</label>
            <input type="radio" id="star3" name="stars" value="stars"
                   >
            <label for="star3">3</label>
            <input type="radio" id="star4" name="stars" value="stars"
                   >
            <label for="star4">4</label>
            <input type="radio" id="star5" name="stars" value="stars"
                   checked>
            <label for="star5">5</label>
        </div>
        <button class="opinion" type="submit">opinar</button>
    </div>
    <div class="empty-text" id="empty">AUN NO HAY VALORACIONES</div>
    <div class="empty-text" id="not-empty">VALORACIONES</div>
    <div class="finished-rate border">
        <div class="finished-rate-info">
            <div id="name">TIA PAOLA</div>
            <div id="rating">X Estrellas</div>
        </div>
        <div id="finished-comment">Comment</div>
    </div>
</div>
</body>
</html>
