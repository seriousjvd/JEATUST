package es.unex.giiis.pi.jeatust.controller;

import java.io.*;
import java.sql.Connection;

import es.unex.giiis.pi.jeatust.dao.*;
import es.unex.giiis.pi.jeatust.model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet.do")
public class LoginServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") != null) {
            response.sendRedirect("order/ListOrderServlet.do");
        } else {
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            try {
                view.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");

        UserDAO userDao = new JDBCUserDAOImpl();
        userDao.setConnection(conn);

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDao.get(username);

        if ((user != null) && (user.getPassword().equals(password))) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("orders/ListOrderServlet.do");
        } else {
            request.setAttribute("messages", "Wrong username or password!!");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            try {
                view.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void destroy() {
    }
}