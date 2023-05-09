<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JEATUST</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/search_icon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <jsp:include page="AppHeader.jsp">
        <jsp:param name="noparam" value="" />
    </jsp:include>
    <div class="central-big border">
        <p class="title">Introduce tu dirección para ver restaurantes cerca de ti</p>
        <input class="search-input" type="text" placeholder="ej. Calle Londres, 10, Cáceres / Cáceres / Buscar por nombre ...">
        <p class="text">Tipos de cocina más populares</p>
        <div class="types-grid">
            <a class="types-grid-item" href="<c:url value='/SearchServlet.do'/>">Todos</a>
        <c:forEach var="category" items="${categoryList}">
            <a class="types-grid-item" href="<c:url value='/SearchServlet.do?category=${category.id}'/>">${category.name}</a>
        </c:forEach>
        </div>
    </div>
</body>
</html>
