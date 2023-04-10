package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.Category;
import es.unex.giiis.pi.jeatust.model.Dish;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet.do")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        DishDAO dishDAO = new JDBCDishDAOImpl();
        dishDAO.setConnection(conn);

        Dish dish = dishDAO.get(Long.parseLong(request.getParameter("dishId")));

        HttpSession session = request.getSession();
        List<Dish> orderDishes = (List<Dish>) session.getAttribute("orderDishes");

        if (orderDishes == null) {
            orderDishes = new ArrayList<>();
        }

        if (dish != null) {
            orderDishes.add(dish);
            session.setAttribute("orderDishes", orderDishes);
        } else {
            logger.info("Error while retrieving the dish from the db. Impossible to add to List");
        }

        RequestDispatcher view = request.getRequestDispatcher("/Restaurant.jsp");
        view.forward(request,response);
    }
}
