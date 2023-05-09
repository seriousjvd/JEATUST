package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.CategoryDAO;
import es.unex.giiis.pi.jeatust.dao.JDBCCategoryDAOImpl;
import es.unex.giiis.pi.jeatust.dao.JDBCRestaurantDAOImpl;
import es.unex.giiis.pi.jeatust.dao.RestaurantDAO;
import es.unex.giiis.pi.jeatust.model.Category;
import es.unex.giiis.pi.jeatust.model.Restaurant;
import es.unex.giiis.pi.jeatust.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "RestaurantManagerServlet", value = "/RestaurantManagerServlet.do")
public class RestaurantManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        RestaurantDAO restaurantDAO = new JDBCRestaurantDAOImpl();
        restaurantDAO.setConnection(conn);

        boolean restaurantsCheck;
        User user = (User) session.getAttribute("user");
        List<Restaurant> restaurantList = restaurantDAO.getAllByUser(user.getId());
        if(restaurantList.size() > 0) {
            restaurantsCheck = true;
            request.setAttribute("restaurantList", restaurantList);
        } else {
            restaurantsCheck = false;
        }
        request.setAttribute("restaurantsCheck", restaurantsCheck);
        RequestDispatcher view = request.getRequestDispatcher("/RestaurantManager.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
