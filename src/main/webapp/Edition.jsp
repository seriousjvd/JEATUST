<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 06/04/2023
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <form method="post" action="EditionServlet.do" class="central-big border">
        <input id="id" name="id" value="${restaurantId}" type="hidden">
        <div class="title">
            ${restaurantTitle}
        </div>
        <div class="edition-column-container border">
            <div class="edition-box">
                <div>Nombre</div>
                <input type="text" id="name" name="name" value=${restaurantName}>
            </div>
            <div class="edition-box">
                <div>Direccion</div>
                <input type="text" id="address" name="address" value=${restaurantAddress}>
            </div>
            <div class="edition-box">
                <div>Ciudad</div>
                <input type="text" id="city" name="city" value=${restaurantCity}>
            </div>
            <div class="edition-box">
                <div>Telefono de contacto</div>
                <input type="text" id="phone" name="phone" value=${restaurantPhone}>
            </div>
            <div class="edition-box">
                <div>E-mail</div>
                <input type="text" id="email" name="email" value=${restaurantMail}>
            </div>
            <div class="edition-box">
                <div>Rango de precios</div>
                <input type="text" id="min" name="min" value=${restaurantMinPrice}>
                <div>-</div>
                <input type="text" id="max" name="max" value=${restaurantMaxPrice}>
            </div>
            <div class="edition-box">
                <fieldset>
                    <legend>Estado del restaurante:</legend>
                    <div>
                        <input type="radio" id="open" name="available" value="open" ${restaurantAvailable ? "checked" : ""}>
                        <label for="open">Acepta pedidos</label>
                    </div>
                    <div>
                        <input type="radio" id="close" name="available" value="close" ${!restaurantAvailable ? "checked" : ""}>
                        <label for="close">No acepta pedidos</label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="edit-row-container border">
            <fieldset>
                <legend>Categorias:</legend>
            <c:forEach var="category" items="${categoryList}">
                <div>
                    <input type="checkbox" id="${category.id}" value="${category.id}" name="category" ${categories.contains(category.id) ? "checked" : ""}>
                    <label for="${category.id}">${category.name}</label>
                </div>
            </c:forEach>
            </fieldset>
            <fieldset>
                <legend>Bike friendly:</legend>
                <div>
                    <input type="radio" id="bike_friendly" name="bike_friendly" value="1" ${restaurantBikeFriendly ? "checked" : ""}>
                    <label for="bike_friendly">Sí</label>
                </div>
                <div>
                    <input type="radio" id="bike_unfriendly" name="bike_friendly" value="0" ${!restaurantBikeFriendly ? "checked" : ""}>
                    <label for="bike_unfriendly">No</label>
                </div>
            </fieldset>
        </div>
        <div class="text">
            Menu
        </div>
        <div class="menu-column">
            <c:choose>
                <c:when test="${!dishesCheck}">
                    <c:choose>
                    <c:when test="${restaurantCheck}">
                    <div class="text">
                        AUN NO HAY PLATOS
                    </div>
                    </c:when>
                    <c:otherwise>
                    <div class="text">
                        GUARDE EL RESTAURANTE PARA AÑADIR SU MENU
                    </div>
                    </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:forEach var="dish" items="${dishList}">
                        <div class="menu-item">
                            <div class="menu-item-info">
                                <div id="dish-name">${dish.name}</div>
                                <div id="dish-description">${dish.description}</div>
                                <div id="dish-price">${dish.price}</div>
                            </div>
                            <div class="menu-item-buttons">
                                <a href="${pageContext.request.contextPath}/DishServlet.do?dish=${dish.id}&restaurant=${restaurantId}"><button type="button">editar</button></a>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="button-list">
            <a class="${!restaurantCheck ? "hide" : ""}" href="${pageContext.request.contextPath}/DishServlet.do?restaurant=${restaurantId}"><button type="button">Añadir plato</button></a>
            <button type="submit" name="action" value="save">Guardar</button>
            <button class="${!restaurantCheck ? "hide" : ""}" type="submit" name="action" value="delete">Borrar restaurante</button>
        </div>
    </form>
</body>
</html>
