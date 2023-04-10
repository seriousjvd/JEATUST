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

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "CheckOrderServlet", value = "/CheckOrderServlet.do")
public class CheckOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<Dish> orderDishes = (List<Dish>) session.getAttribute("orderDishes");
        int totalPrice = 0;

        for (Dish dish: orderDishes) {
            totalPrice += dish.getPrice();
        }

        session.setAttribute("totalPrice", totalPrice);

        RequestDispatcher view = request.getRequestDispatcher("/CheckOrder.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<Dish> orderDishes = (List<Dish>) session.getAttribute("orderDishes");
        Order order = new Order();

        order.setTotalPrice(Integer.parseInt((String) session.getAttribute("totalPrice")));

        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        OrderDAO orderDAO = new JDBCOrderDAOImpl();
        OrderDishesDAO orderDishesDAO = new JDBCOrderDishesDAOImpl();
        orderDAO.setConnection(conn);
        orderDishesDAO.setConnection(conn);

        User user = (User) session.getAttribute("user");

        if (orderDishes != null && user != null) {
            order.setIdu(user.getId());
            long ido = orderDAO.add(order);

            for (Dish dish: orderDishes) {
                OrderDishes orderDish = new OrderDishes();
                orderDish.setIdo(ido);
                orderDish.setIddi(dish.getId());
                orderDishesDAO.add(orderDish);
            }

            RequestDispatcher view = request.getRequestDispatcher("/Profile.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Home.jsp");
        }
    }
}
