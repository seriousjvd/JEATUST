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
<jsp:include page="AppHeader.jsp">
    <jsp:param name="noparam" value="" />
</jsp:include>
<form method="post" action="ReviewServlet.do" class="central-big border">
    <input id="restaurantId" name="restaurantId" value="${restaurantId}" type="hidden">
    <div class="title">
        Horizon Lunar Colony
    </div>
    <div class="rate-box border">
        <textarea id="comment" placeholder="Escriba aqui su comentario" value="${reviewComment}"></textarea>
        <div class="rating">
            <input type="radio" id="star1" name="stars" value="1" ${starChecked = 1 ? "checked" : ""}>
            <label for="star1">1</label>
            <input type="radio" id="star2" name="stars" value="2" ${starChecked = 2 ? "checked" : ""}>
            <label for="star2">2</label>
            <input type="radio" id="star3" name="stars" value="3" ${starChecked = 3 ? "checked" : ""}>
            <label for="star3">3</label>
            <input type="radio" id="star4" name="stars" value="4" ${starChecked = 4 ? "checked" : ""}>
            <label for="star4">4</label>
            <input type="radio" id="star5" name="stars" value="5" ${starChecked = 5 ? "checked" : ""}>
            <label for="star5">5</label>
        </div>
        <button class="opinion" type="submit" name="action" value="save">opinar</button>
        <button class="opinion" type="submit" name="action" value="delete">borrar</button>
    </div>

    <c:choose>
        <c:when test="${!reviewCheck}">
            <div class="text" id="empty">AUN NO HAY VALORACIONES</div>
        </c:when>
        <c:otherwise>
            <div class="text" id="not-empty">VALORACIONES</div>
            <c:forEach var="review" items="${reviewList}">
                <div class="finished-rate border">
                    <div class="finished-rate-info">
                        <div id="name" name="review">${review.review}</div>
                        <div id="grade" name="grade">${review.grade}</div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</form>
</body>
</html>
