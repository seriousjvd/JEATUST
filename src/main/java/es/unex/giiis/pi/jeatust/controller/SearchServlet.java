package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.Category;
import es.unex.giiis.pi.jeatust.model.Restaurant;
import es.unex.giiis.pi.jeatust.model.RestaurantCategories;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;

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

        List<NameValuePair> queryParams = URLEncodedUtils.parse(request.getQueryString(), StandardCharsets.UTF_8);
        Map<String, String> params = queryParams.stream().collect(Collectors.toMap(NameValuePair::getName, NameValuePair::getValue));

        request.setAttribute("address", params.get("key") != null ? params.get("key") : "ADDRESS");

        List<Restaurant> restaurantList = new ArrayList<Restaurant>();
        List<RestaurantCategories> restaurantCategoriesList;
        if(params.isEmpty()) { // todos
            restaurantList = restaurantDAO.getAll();
        } else if(params.get("category") != null) { // en la url viene una categoría
            restaurantCategoriesList = restaurantCategoriesDAO.getAllByCategory(Long.parseLong(params.get("category")));
            restaurantList = new ArrayList<Restaurant>();
            for (RestaurantCategories param : restaurantCategoriesList) {
                restaurantList.add(restaurantDAO.get(param.getIdr()));
            }
        } else if(params.get("key") != null) { //en la url viene una localización
            restaurantList = restaurantDAO.getAllBySearchName(params.get("key"));
        }

        request.setAttribute("restaurantList", restaurantList);

        RequestDispatcher view = request.getRequestDispatcher("/Search.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
