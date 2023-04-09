<%--
  Created by IntelliJ IDEA.
  User: Juan
  Date: 06/04/2023
  Time: 18:21
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
            Horizon Lunar Colony
        </div>
        <div class="edition-column-container border">
            <div class="edition-box">
                <div>Nombre</div>
                <input type="text" id="name" name="name" />
            </div>
            <div class="edition-box">
                <div>Direccion</div>
                <div><textarea id="location">Dirección</textarea></div>
            </div>
            <div class="edition-box">
                <div>Telefono de contacto</div>
                <input type="text" id="phone" name="phone" />
            </div>
            <div class="edition-box">
                <div>E-mail</div>
                <input type="text" id="email" name="email" />
            </div>
            <div class="edition-box">
                <div>Rango de precios</div>
                <input type="text" id="min" name="min" />
                <div>-</div>
                <input type="text" id="max" name="max" />
            </div>
            <div class="edition-box">
                <fieldset>
                    <legend>Estado del restaurante:</legend>
                    <div>
                        <input type="radio" id="open" name="open" value="open"
                               checked>
                        <label for="open">Acepta pedidos</label>
                    </div>
                    <div>
                        <input type="radio" id="close" name="close" value="close">
                        <label for="close">No acepta pedidos</label>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="edit-row-container border">
            <fieldset>
                <legend>Categorias:</legend>
                <div>
                    <input type="checkbox" id="italiana" name="italiana" checked>
                    <label for="italiana">Italiana</label>
                </div>
                <div>
                    <input type="checkbox" id="turca" name="turca">
                    <label for="turca">Turca</label>
                </div>
                <div>
                    <input type="checkbox" id="alemana" name="alemana">
                    <label for="alemana">Alemana</label>
                </div>
                <div>
                    <input type="checkbox" id="americana" name="americana">
                    <label for="americana">Americana</label>
                </div>
            </fieldset>
            <fieldset>
                <legend>Valoracion:</legend>
                <div>
                    <input type="radio" id="stars" name="stars" value="stars"
                           checked>
                    <label for="stars">Estrellas</label>
                </div>
                <div>
                    <input type="radio" id="numbers" name="numbers" value="numbers">
                    <label for="numbers">Numeros</label>
                </div>
            </fieldset>
            <fieldset>
                <legend>Bike friendly:</legend>
                <div>
                    <input type="radio" id="bike_friendly" name="bike_friendly" value="bike_friendly"
                           checked>
                    <label for="bike_friendly">Sí</label>
                </div>
                <div>
                    <input type="radio" id="bike_unfriendly" name="bike_unfriendly" value="bike_unfriendly">
                    <label for="bike_unfriendly">No</label>
                </div>
            </fieldset>
        </div>
        <div class="menu-column">
            <div class="menu-item">
                <div class="menu-item-info">
                    <div id="dish-name">Comida</div>
                    <div id="dish-description">Comida hecha usando comida</div>
                    <div id="dish-price">Comida€</div>
                </div>
                <div class="menu-item-buttons">
                    <button type="submit">editar</button>
                    <button type="submit">borrar</button>
                </div>
            </div>
        </div>
        <div class="button-list">
            <button type="submit">Añadir plato</button>
            <button type="submit">Guardar</button>
            <button type="submit">Borrar restaurante</button>
        </div>
    </div>
</body>
</html>
