package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.JDBCUserDAOImpl;
import es.unex.giiis.pi.jeatust.dao.UserDAO;
import es.unex.giiis.pi.jeatust.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.logging.Logger;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet.do")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/HomeServlet.do");
        } else {
            RequestDispatcher view = request.getRequestDispatcher("/Register.jsp");
            view.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        logger.info("Handling register POST");

        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        UserDAO userDao = new JDBCUserDAOImpl();
        userDao.setConnection(conn);

        User user = new User();
        user.setName(request.getParameter("firstName"));
        user.setSurname(request.getParameter("lastName"));
        user.setEmail(request.getParameter("mail"));
        user.setPassword(request.getParameter("password"));

        logger.info("Client name: " + user.getName() + " " + user.getSurname());

        if (user.validateName() && user.validatePassword()) {
            userDao.add(user);
            user = null;
            response.sendRedirect(request.getContextPath() + "/HomeServlet.do");
        } else {
            RequestDispatcher view = request.getRequestDispatcher("/Register.jsp");
            view.forward(request, response);
        }
    }
}
