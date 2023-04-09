package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.CategoryDAO;
import es.unex.giiis.pi.jeatust.dao.JDBCCategoryDAOImpl;
import es.unex.giiis.pi.jeatust.model.Category;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "HomeServlet", value = "/HomeServlet.do")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        CategoryDAO categoryDAO = new JDBCCategoryDAOImpl();
        categoryDAO.setConnection(conn);

        List<Category> categoryList = categoryDAO.getAll();
        request.setAttribute("categoryList", categoryList);

        RequestDispatcher view = request.getRequestDispatcher("/Home.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
