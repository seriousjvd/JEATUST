package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.Category;
import es.unex.giiis.pi.jeatust.model.Restaurant;
import es.unex.giiis.pi.jeatust.model.RestaurantCategories;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@WebServlet(name = "SearchServlet", value = "/SearchServlet.do")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
        RestaurantDAO restaurantDAO = new JDBCRestaurantDAOImpl();
        RestaurantCategoriesDAO restaurantCategoriesDAO = new JDBCRestaurantCategoriesDAOImpl();
        categoryDAO.setConnection(conn);
        restaurantDAO.setConnection(conn);
        restaurantCategoriesDAO.setConnection(conn);

        List<Category> categoryList = categoryDAO.getAll();
        request.setAttribute("categoryList", categoryList);

        Map<String, String> parameters = new HashMap<>();

        String queryString = request.getQueryString();
        if (queryString != null) {
            String[] urlParams = queryString.split("&");
            for (String param : urlParams) {
                String[] parts = param.split("=");
                parameters.put(parts[0], parts[1]);
            }
        }
        String direction;
        if(parameters.get("key") != null) {
            direction = parameters.get("key");
            request.setAttribute("direction", direction);
        } else {
            request.setAttribute("direction", "DIRECTION");
        }

        List<Restaurant> restaurantList = new ArrayList<Restaurant>();
        List<RestaurantCategories> restaurantCategoriesList;
        if(parameters.isEmpty()) { // todos
            restaurantList = restaurantDAO.getAll();
        } else if(parameters.get("category") != null) { // en la url viene una categoría
            restaurantCategoriesList = restaurantCategoriesDAO.getAllByCategory(Long.parseLong(parameters.get("category")));
            restaurantList = new ArrayList<Restaurant>();
            Restaurant restaurant;
            for (RestaurantCategories param : restaurantCategoriesList)
                restaurantList.add(restaurantDAO.get(param.getIdr()));
        } else if(parameters.get("key") != null) { //en la url viene una localización
            restaurantList = restaurantDAO.getAllBySearchName(parameters.get("key"));
        }

        request.setAttribute("restaurantList", restaurantList);

        RequestDispatcher view = request.getRequestDispatcher("/Search.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
