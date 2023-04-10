package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.Order;
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
import java.util.Objects;
import java.util.logging.Logger;

@WebServlet(name = "ProfileServlet", value = "/ProfileServlet.do")
public class ProfileServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        OrderDAO orderDAO = new JDBCOrderDAOImpl();
        orderDAO.setConnection(conn);

        boolean orderCheck;
        User user = (User) session.getAttribute("user");
        String userFirstName = user.getName();
        String userLastName = user.getSurname();
        String userEmail = user.getEmail();
        String userPassword = user.getPassword();

        request.setAttribute("userFirstName", userFirstName);
        request.setAttribute("userLastName", userLastName);
        request.setAttribute("userEmail", userEmail);
        request.setAttribute("userPassword", userPassword);

        List<Order> orderList = orderDAO.getAllByIdu(user.getId());

        if(orderList.size() > 0){
            orderCheck = true;
            request.setAttribute("orderList", orderList);
        } else {
            orderCheck = false;
        }
        request.setAttribute("orderCheck", orderCheck);

        RequestDispatcher view = request.getRequestDispatcher("/Profile.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        UserDAO userDAO = new JDBCUserDAOImpl();
        userDAO.setConnection(conn);

        User user = (User) session.getAttribute("user");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password= request.getParameter("password");

        String action = request.getParameter("action");
        if(Objects.equals(action, "save")) {
            user.setName(firstName);
            user.setSurname(lastName);
            user.setEmail(email);
            user.setPassword(password);
            userDAO.update(user);
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/ProfileServlet.do");
        } else {
            user = userDAO.get(user.getEmail());
            userDAO.delete(user.getId());
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/LoginServlet.do");
        }
    }
}