package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.util.EncodingUtils;
import org.sqlite.util.StringUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "EditionServlet", value = "/EditionServlet.do")
public class EditionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        RestaurantDAO restaurantDAO = new JDBCRestaurantDAOImpl();
        restaurantDAO.setConnection(conn);
        CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
        categoryDAO.setConnection(conn);
        RestaurantCategoriesDAO restaurantCategoriesDAO = new JDBCRestaurantCategoriesDAOImpl();
        restaurantCategoriesDAO.setConnection(conn);

        boolean dishesCheck = false;
        boolean restaurantCheck = false;
        //check url, if it has restaurant id is an edit request, if it has not is an add request
        List<NameValuePair> queryParams = URLEncodedUtils.parse(request.getQueryString(), StandardCharsets.UTF_8);
        Optional<NameValuePair> restaurantId = queryParams.stream().filter((pair) -> pair.getName().equals("restaurant")).findFirst();
        if (restaurantId.isPresent()) {
            long id = Long.parseLong(restaurantId.get().getValue());
            Restaurant requestedRestaurant = restaurantDAO.get(id);
            request.setAttribute("restaurantId", requestedRestaurant.getId());
            request.setAttribute("restaurantTitle", requestedRestaurant.getName());
            request.setAttribute("restaurantName", requestedRestaurant.getName());
            request.setAttribute("restaurantAddress", requestedRestaurant.getAddress());
            request.setAttribute("restaurantCity", requestedRestaurant.getCity());
            request.setAttribute("restaurantPhone", requestedRestaurant.getTelephone());
            request.setAttribute("restaurantMail", requestedRestaurant.getContactEmail());
            request.setAttribute("restaurantMinPrice", requestedRestaurant.getMinPrice());
            request.setAttribute("restaurantMaxPrice", requestedRestaurant.getMaxPrice());
            request.setAttribute("restaurantAvailable", requestedRestaurant.getAvailable() != 0);
            request.setAttribute("restaurantBikeFriendly", requestedRestaurant.getBikeFriendly() != 0);
            request.setAttribute("categories", restaurantCategoriesDAO.getAllByRestaurant(requestedRestaurant.getId()).stream().map(RestaurantCategories::getIdct).collect(Collectors.toList()));

            DishDAO dishDAO = new JDBCDishDAOImpl();
            dishDAO.setConnection(conn);
            List<Dish> dishList = dishDAO.getAllByRestaurantId(requestedRestaurant.getId());
            dishesCheck = !dishList.isEmpty();
            restaurantCheck = true;
            request.setAttribute("dishList", dishList);
        } else {
            request.setAttribute("restaurantTitle", "Nuevo Restaurante");
            request.setAttribute("restaurantAvailable", true);
            request.setAttribute("restaurantBikeFriendly", true);
        }
        request.setAttribute("dishesCheck", dishesCheck);
        request.setAttribute("restaurantCheck", restaurantCheck);
        List<Category> categoryList = categoryDAO.getAll();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher view = request.getRequestDispatcher("/Edition.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        RestaurantDAO restaurantDAO = new JDBCRestaurantDAOImpl();
        restaurantDAO.setConnection(conn);

        String stringId = request.getParameter("id");

        String action = request.getParameter("action");
        if (Objects.equals(action, "save")) {
            Restaurant restaurant = new Restaurant();
            restaurant.setName(request.getParameter("name"));
            restaurant.setAddress(request.getParameter("address"));
            restaurant.setTelephone(request.getParameter("phone"));
            restaurant.setCity(request.getParameter("city"));
            restaurant.setContactEmail(request.getParameter("email"));
            restaurant.setGradesAverage(0);
            restaurant.setMinPrice(Integer.parseInt(request.getParameter("min")));
            restaurant.setMaxPrice(Integer.parseInt(request.getParameter("max")));
            int available = request.getParameter("available") != null &&
                    request.getParameter("available").equals("close") ? 0 : 1;
            restaurant.setAvailable(available);
            int bikeFriendly = Integer.parseInt(request.getParameter("bike_friendly"));
            restaurant.setBikeFriendly(bikeFriendly);
            restaurant.setIdu((int) ((User) session.getAttribute("user")).getId());

            long id;
            if(stringId != null && !stringId.isEmpty()) {
                id = Long.parseLong(stringId);
                restaurant.setId(id);
                restaurantDAO.update(restaurant);
            } else {
                id = restaurantDAO.add(restaurant);
            }
            saveCategories(request, id);
        } else {
            if (stringId != null && !stringId.isEmpty()) {
                restaurantDAO.delete(Long.parseLong(stringId));
            }
        }
        response.sendRedirect(request.getContextPath() + "/RestaurantManagerServlet.do");
    }

    protected void saveCategories(HttpServletRequest request, long idr) {
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
        categoryDAO.setConnection(conn);
        RestaurantCategoriesDAO restaurantCategoriesDAO = new JDBCRestaurantCategoriesDAOImpl();
        restaurantCategoriesDAO.setConnection(conn);

        String stringId = request.getParameter("id");

        if (stringId != null) {
            restaurantCategoriesDAO.deleteByIdr(idr);
        }

        List<Category> categoryList = categoryDAO.getAll();
        if(request.getParameterValues("category") != null) {
            for (String category : request.getParameterValues("category")) {
                RestaurantCategories restaurantCategory = new RestaurantCategories();
                restaurantCategory.setIdr(idr);
                restaurantCategory.setIdct(Long.parseLong(category));
                restaurantCategoriesDAO.add(restaurantCategory);
            }
        }
    }
}