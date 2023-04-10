package es.unex.giiis.pi.jeatust.controller;

import es.unex.giiis.pi.jeatust.dao.*;
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
import java.util.Optional;
import java.util.logging.Logger;

@WebServlet(name = "RestaurantServlet", value = "/RestaurantServlet.do")
public class RestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(HttpServlet.class.getName());

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Connection conn = (Connection) getServletContext().getAttribute("dbConn");
        RestaurantDAO restaurantDAO = new JDBCRestaurantDAOImpl();
        DishDAO dishDAO = new JDBCDishDAOImpl();
        restaurantDAO.setConnection(conn);
        dishDAO.setConnection(conn);

        List<NameValuePair> queryParams = URLEncodedUtils.parse(request.getQueryString(), StandardCharsets.UTF_8);
        Optional<NameValuePair> restaurantId = queryParams.stream().filter((pair) -> pair.getName().equals("restaurant")).findFirst();

        if (restaurantId.isPresent()) {
            long idr = Long.parseLong(restaurantId.get().getValue());
            Restaurant requestedRestaurant = restaurantDAO.get(idr);
            List<Dish> dishList = dishDAO.getAllByRestaurantId(idr);
            request.setAttribute("restaurant", requestedRestaurant);
            request.setAttribute("dishList", dishList);
            request.setAttribute("dishCheck", !dishList.isEmpty());

            RequestDispatcher view = request.getRequestDispatcher("/Restaurant.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/HomeServlet.do");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void destroy() {
    }
}