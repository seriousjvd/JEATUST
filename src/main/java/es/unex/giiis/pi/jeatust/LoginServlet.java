package es.unex.giiis.pi.jeatust;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet.do")
public class LoginServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("home.jsp");
    }

    public void destroy() {
    }
}