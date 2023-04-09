package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.CategoryDAO;
import es.unex.giiis.pi.jeatust.dao.JDBCCategoryDAOImpl;
import es.unex.giiis.pi.jeatust.model.Category;
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

        RequestDispatcher view = request.getRequestDispatcher("/CheckOrder.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
