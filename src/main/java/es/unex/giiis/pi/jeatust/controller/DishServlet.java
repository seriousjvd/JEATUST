package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.Category;
import es.unex.giiis.pi.jeatust.model.Dish;
import es.unex.giiis.pi.jeatust.model.Restaurant;
import es.unex.giiis.pi.jeatust.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@WebServlet(name = "DishServlet", value = "/DishServlet.do")
public class DishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        DishDAO dishDAO = new JDBCDishDAOImpl();
        dishDAO.setConnection(conn);

        List<NameValuePair> queryParams = URLEncodedUtils.parse(request.getQueryString(), StandardCharsets.UTF_8);
        Map<String, String> params = queryParams.stream().collect(Collectors.toMap(NameValuePair::getName, NameValuePair::getValue));
        if(params.get("dish") != null) {
            Dish requestedDish = dishDAO.get(Long.parseLong(params.get("dish")));
            request.setAttribute("dishName", requestedDish.getName());
            request.setAttribute("dishDescrition", requestedDish.getDescription());
            request.setAttribute("dishPrice", requestedDish.getPrice());
            request.setAttribute("dishId", params.get("dish"));
        }
        request.setAttribute("restaurantId", params.get("restaurant"));

        RequestDispatcher view = request.getRequestDispatcher("/Dish.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        DishDAO dishDAO = new JDBCDishDAOImpl();
        dishDAO.setConnection(conn);

        String stringId = request.getParameter("id");
        String action = request.getParameter("action");
        if (Objects.equals(action, "save")) {
            Dish dish = new Dish();
            dish.setName(request.getParameter("name"));
            dish.setDescription(request.getParameter("description"));
            dish.setPrice(Integer.parseInt(request.getParameter("price")));
            dish.setIdr(Long.parseLong(request.getParameter("restaurantId")));
            long id;
            if(stringId != null && !stringId.isEmpty()) {
                id = Long.parseLong(stringId);
                dish.setId(id);
                dishDAO.update(dish);
            } else {
                dishDAO.add(dish);
            }
        } else {
            if (stringId != null && !stringId.isEmpty()) {
                dishDAO.delete(Long.parseLong(stringId));
            }
        }
        response.sendRedirect(request.getContextPath() + "/EditionServlet.do?restaurant="+request.getParameter("restaurantId"));
    }
}
